class GithubPullRequestService < Versioneye::Service


  def self.process repo_name, branch, commits_url, pr_nr
    log.info "process #{repo_name}, #{branch}, #{commits_url}, #{pr_nr}"

    last_commit = nil
    projects = Project.where(:scm_fullname => repo_name, :temp => false)

    pr = create_pullrequest( repo_name, branch, pr_nr, projects, commits_url )
    if pr.nil?
      log.error "ERROR in GithubPullRequestService. Could not create pullrequest! #{repo_name}:#{branch}:#{pr_nr}:#{commits_url}"
      return nil
    end

    filenames = []
    projects.each do |project|
      token    = GithubUpdater.new.fetch_token_for project
      filename = project.s3_filename
      next if filenames.include?(filename)

      success = process_file( repo_name, filename, branch, token, pr )
      filenames << filename if success
    end
    true
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
    false
  end


  def self.process_file repo_name, filename, branch, token, pr
    tree_sha = pr.tree_sha
    project_file = Github.fetch_project_file_from_branch( repo_name, filename, branch, token, tree_sha )
    new_project  = ProjectImportService.create_project_from project_file, token
    new_project.name = filename
    new_project.temp = true
    new_project.temp_lock = true # prevent from deletion
    new_project.save
    ProjectdependencyService.update_licenses_security new_project

    new_project.dependencies.each do |dep|
      if !dep.sv_ids.empty?
        create_sec_issue filename, dep, pr
      end
    end

    new_project.temp_lock = false # allow to delete
    new_project.save
    true
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
    false
  end


  def self.create_sec_issue filename, dep, pullrequest
    message = "#{dep.sv_ids.count} security vulnerability."
    message = "#{dep.sv_ids.count} security vulnerabilities." if dep.sv_ids.count > 1

    issue = PrIssue.new({
      :file => filename,
      :language => dep.language,
      :prod_key => dep.prod_key,
      :version_label => dep.version_label,
      :version_requested => dep.version_requested,
      :message => message,
      :issue_type => PrIssue::A_ISSUE_SECURITY })
    issue.pullrequest = pullrequest
    if issue.save
      pullrequest.security_count += 1
      pullrequest.save
    end
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
  end


  def self.create_pullrequest repo_name, branch, pr_nr, projects, commits_url
    projects.each do |project|
      token       = GithubUpdater.new.fetch_token_for project
      last_commit = fetch_last_commit(commits_url, token)
      next if last_commit.nil?

      commit_sha  = last_commit[:sha]
      tree_sha    = last_commit[:commit][:tree][:sha]
      pr = Pullrequest.new({
        :scm_provider => Pullrequest::A_SCM_GITHUB,
        :scm_fullname => repo_name,
        :scm_branch => branch,
        :pr_number => pr_nr,
        :commit_sha => commit_sha,
        :tree_sha => tree_sha})
      pr.save
      return pr
    end
    nil
  end


  def self.fetch_last_commit commits_url, token
    commits = Github.get_json commits_url, token
    commits.last
  rescue => e
    nil
  end


end