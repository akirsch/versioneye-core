class Organisation < Versioneye::Model

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,     type: String
  field :company,  type: String
  field :location, type: String
  field :email,    type: String
  field :website,  type: String

  field :mattp,    type: Boolean, default: false # mattp    = member allowed to transfer projects to this organisation
  field :matattp,  type: Boolean, default: false # matattp  = member allowed to assign teams to projects

  # Team members are allowed to add new team members to their own team
  field :matanmtt, type: Boolean, default: false # matanmtt = member allowed to add new members to team

  field :stripe_token      , type: String
  field :stripe_customer_id, type: String

  field :max_private_projects, type: Integer, default: 0  # max closed source projects allowed
  field :max_os_projects     , type: Integer, default: 0  # max Open Source projects allowed
  field :pdf_exports         , type: Boolean, default: false
  field :change_visibility   , type: Boolean, default: false

  belongs_to :plan
  has_one    :billing_address
  has_many   :projects
  has_many   :teams
  has_many   :license_whitelists
  has_many   :component_whitelists

  validates_presence_of   :name, :message => 'is mandatory!'
  validates_uniqueness_of :name, :message => 'exist already.'

  index({ name: 1 }, { name: "name_index", background: true, unique: true })


  def to_s
    name
  end

  def receipts
    Receipt.where(:organisation_id => self.ids)
  end

  def api( read_only = false )
    api = Api.where( active: true, organisation_id: self.ids, read_only: read_only ).first
    api = Api.create_new_for_orga( self, read_only ) if api.nil?
    api
  end

  def api_key( read_only = false )
    self.api( read_only ).api_key
  end

  def fetch_or_create_billing_address
    if self.billing_address.nil?
      self.billing_address = BillingAddress.new
    end
    self.billing_address
  end

  def default_lwl_id
    return nil if license_whitelists.nil? || license_whitelists.empty?

    license_whitelists.each do |lwl|
      return lwl.ids if lwl.default == true
    end
    nil
  end

  def default_cwl_id
    return nil if component_whitelists.nil? || component_whitelists.empty?

    component_whitelists.each do |cwl|
      return cwl.ids if cwl.default == true
    end
    nil
  end

  def to_param
    name
  end

  def team_projects team_id
    projects.parents.where(:team_ids => team_id, :temp => false)
  end

  def parent_projects
    projects.parents.where(:temp => false)
  end

  def owner_team
    teams.each do |team|
      return team if team.name.eql?(Team::A_OWNERS)
    end
    nil
  end

  def teams_by user
    ts = []
    teams.each do |team|
      team.members.each do |member|
        ts << team if member.user.ids.eql?(user.ids)
      end
    end
    ts
  end

  def team_by name
    return nil if name.to_s.empty?
    teams.where(:name => name).first
  end

  def unknown_license_deps
    deps = []
    projects.each do |project|
      pdeps = project.unknown_license_deps
      pdeps.each do |dep|
        prod_key = dep.prod_key
        prod_key = "#{dep.group_id}/#{dep.artifact_id}" if prod_key.to_s.empty?
        k = "#{dep.language}:#{prod_key}:#{dep.version_requested}"
        next if deps.include?( k )
        next if k.match(/com\.hybris/)
        deps.push k
        p "#{k} - #{dep.ids}"
      end
    end
    deps
  end


  def component_list_csv team = 'ALL', language = nil, version = nil, after_filter = 'ALL'
    comps = component_list team, language, version, after_filter
    csv_string = CSV.generate(:col_sep => ";") do |csv|
      csv << ['Language', 'Dependency', 'Newest Version', ' Used Version', 'License', 'Security Vulnerabilities', 'Project ID', 'Project Name', 'Project Version', 'Project GroupId', 'Project ArtifactId']
      comps.keys.each do |key|
        dep_lang = key.split(":")[0]
        newest_version = key.split(":")[2]
        dep = comps[key]
        dep.keys.each do |dep_version_key|
          sps = dep_version_key.split("::")
          prod_key = sps[0]
          dep_version = sps[1]
          dep_license = sps[2]
          dep_sv_count = sps[3]
          dep[dep_version_key].each do |pr|
            csv << [dep_lang, prod_key, newest_version, dep_version, dep_license, dep_sv_count, pr[:project_id], pr[:project_name], pr[:project_version], pr[:project_group_id], pr[:project_artifact_id]]
          end
        end
      end
    end
    csv_string
  end


  def component_list team = 'ALL', language = nil, version = nil, after_filter = 'ALL'
    return {} if projects.to_a.empty?

    comps = {}
    projects.each do |project|
      if (project.teams.to_a.empty? && self.owner_team)
        project.teams = [self.owner_team]
        project.save
      end

      next if !language.to_s.empty? && !language.to_s.eql?('ALL') && !project.language.to_s.downcase.eql?( language.to_s.downcase )
      next if !version.to_s.empty?  && !version.to_s.eql?('ALL')  && !project.version.to_s.downcase.eql?(  version.to_s.downcase  )

      team_match = false
      project.teams.each do |team_object|
        if team.to_s.eql?('ALL') || team_object.ids.eql?(team.to_s) || team_object.name.eql?(team.to_s)
          team_match = true
          break
        end
      end
      next if team_match == false

      collect_components project.dependencies, comps
      next if project.children.count == 0

      project.children.each do |child|
        if child.teams.to_a.empty?
          child.teams = project.teams
          child.save
        end
        collect_components child.dependencies, comps
      end
    end

    if after_filter.to_s.eql?('duplicates_only')
      return duplicates_only_filter( comps )
    elsif after_filter.to_s.eql?('show_duplicates')
      show_duplicates_filter( comps )
      return comps
    end
    comps
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
    {}
  end


  def unique_languages
    return [] if projects.nil? || projects.empty?

    languages = []
    projects.parents.each do |project|
      languages << project.language if !languages.include?( project.language )
    end

    languages
  end


  def unique_versions
    return [] if projects.nil? || projects.empty?

    versions = []
    projects.parents.each do |project|
      next if project.version.to_s.empty?
      versions << project.version if !versions.include?( project.version )
    end

    versions
  end

  def private_project_count
    Project.where( organisation_id: self.ids, private_project: true, :parent_id => nil ).count
  end

  def max_private_projects_count
    return self.max_private_projects  if self.max_private_projects > 0
    return self.plan.private_projects if !self.plan.nil?
    1
  end

  def max_os_projects_count
    return self.max_os_projects  if self.max_os_projects > 0
    return self.plan.os_projects if !self.plan.nil?
    1
  end

  def pdf_exports_allowed?
    return true if self.pdf_exports == true
    return true if self.plan.price.to_i > 20
    return false
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
    false
  end

  def change_visibility_allowed?
    return true if Settings.instance.environment.eql?("enterprise")
    return true if self.change_visibility == true
    return true if self.plan.price.to_i > 0
    return false
  rescue => e
    log.error e.message
    log.error e.backtrace.join("\n")
    false
  end


  private


    def show_duplicates_filter( comps )
      project_ids = Project.where(:organisation_id => self.ids).distinct(:id)
      comps.keys.each do |key|
        sps = key.split(":")
        language = sps[0]
        prod_key = sps[1]
        pdeps = Projectdependency.where(:language => language, :prod_key => prod_key, :project_id.in => project_ids)
        collect_components pdeps, comps, true
      end
    end


    def duplicates_only_filter( comps )
      response = {}
      comps.keys.each do |key|
        if comps[key].keys.count > 1
          response[key] = comps[key]
        end
      end
      response
    end


    def collect_components project_dependencies, comps, ignore_comp_key = false
      project_dependencies.each do |dep|
        component_key = "#{dep.language}:#{dep.possible_prod_key}:#{dep.version_current}"
        if ignore_comp_key == false
          comps[component_key] = {} if !comps.keys.include?( component_key )
        end

        version_key = "#{dep.possible_prod_key}::#{dep.version_requested}::#{dep.licenses_string}::#{dep.sv_ids.count}"
        comps[component_key][version_key] = [] if comps[component_key][version_key].nil?

        project = dep.project
        team_names = nil
        team_names = project.teams.map(&:name) if !project.teams.to_a.empty?
        val = {:project_language => project.language, :project_name => project.name,
               :project_id => project.ids, :project_version => project.version,
               :project_group_id => project.group_id, :project_artifact_id => project.artifact_id,
               :project_teams => team_names}
        comps[component_key][version_key] << val if !comps[component_key][version_key].include?( val )
      end
      comps
    end

end
