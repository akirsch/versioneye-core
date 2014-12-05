# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: versioneye-core 6.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "versioneye-core"
  s.version = "6.20.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["reiz"]
  s.date = "2014-12-05"
  s.description = "This project contains the Models and Services for VersionEye"
  s.email = "robert.reiz.81@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config/aws.yml",
    "config/log4r.xml",
    "config/mongoid.yml",
    "config/settings.json",
    "lib/settings.rb",
    "lib/versioneye-core.rb",
    "lib/versioneye/cache.rb",
    "lib/versioneye/log.rb",
    "lib/versioneye/mailers/.gitkeep",
    "lib/versioneye/mailers/feedback_mailer.rb",
    "lib/versioneye/mailers/newsletter_mailer.rb",
    "lib/versioneye/mailers/notification_mailer.rb",
    "lib/versioneye/mailers/project_mailer.rb",
    "lib/versioneye/mailers/receipt_mailer.rb",
    "lib/versioneye/mailers/submitted_url_mailer.rb",
    "lib/versioneye/mailers/subscription_mailer.rb",
    "lib/versioneye/mailers/user_mailer.rb",
    "lib/versioneye/mailers/versioncomment_mailer.rb",
    "lib/versioneye/mailers/versioncommentreply_mailer.rb",
    "lib/versioneye/migrations/versionlink_migration.rb",
    "lib/versioneye/model.rb",
    "lib/versioneye/models/api.rb",
    "lib/versioneye/models/api_call.rb",
    "lib/versioneye/models/auditlog.rb",
    "lib/versioneye/models/billing_address.rb",
    "lib/versioneye/models/bitbucket_repo.rb",
    "lib/versioneye/models/circle_element.rb",
    "lib/versioneye/models/crawle.rb",
    "lib/versioneye/models/crawler_task.rb",
    "lib/versioneye/models/dependency.rb",
    "lib/versioneye/models/developer.rb",
    "lib/versioneye/models/docker_image.rb",
    "lib/versioneye/models/email_setting.rb",
    "lib/versioneye/models/error_message.rb",
    "lib/versioneye/models/event.rb",
    "lib/versioneye/models/github_repo.rb",
    "lib/versioneye/models/global_setting.rb",
    "lib/versioneye/models/helpers/billing_types.rb",
    "lib/versioneye/models/helpers/countries.rb",
    "lib/versioneye/models/helpers/indexer.rb",
    "lib/versioneye/models/helpers/product_constants.rb",
    "lib/versioneye/models/helpers/product_es_mapping.rb",
    "lib/versioneye/models/json_cache.rb",
    "lib/versioneye/models/language.rb",
    "lib/versioneye/models/language_daily_stats.rb",
    "lib/versioneye/models/language_feed.rb",
    "lib/versioneye/models/license.rb",
    "lib/versioneye/models/license_cach.rb",
    "lib/versioneye/models/license_element.rb",
    "lib/versioneye/models/license_whitelist.rb",
    "lib/versioneye/models/lottery.rb",
    "lib/versioneye/models/maven_repository.rb",
    "lib/versioneye/models/newest.rb",
    "lib/versioneye/models/notification.rb",
    "lib/versioneye/models/np_domain.rb",
    "lib/versioneye/models/plan.rb",
    "lib/versioneye/models/product.rb",
    "lib/versioneye/models/product_resource.rb",
    "lib/versioneye/models/project.rb",
    "lib/versioneye/models/project_collaborator.rb",
    "lib/versioneye/models/projectdependency.rb",
    "lib/versioneye/models/promo_code.rb",
    "lib/versioneye/models/receipt.rb",
    "lib/versioneye/models/refer.rb",
    "lib/versioneye/models/reference.rb",
    "lib/versioneye/models/repository.rb",
    "lib/versioneye/models/searchlog.rb",
    "lib/versioneye/models/security_notification.rb",
    "lib/versioneye/models/spdx_license.rb",
    "lib/versioneye/models/stash_repo.rb",
    "lib/versioneye/models/submitted_url.rb",
    "lib/versioneye/models/traits/license_trait.rb",
    "lib/versioneye/models/user.rb",
    "lib/versioneye/models/user_email.rb",
    "lib/versioneye/models/user_notification_setting.rb",
    "lib/versioneye/models/userlinkcollection.rb",
    "lib/versioneye/models/version.rb",
    "lib/versioneye/models/versionarchive.rb",
    "lib/versioneye/models/versioncomment.rb",
    "lib/versioneye/models/versioncommentreply.rb",
    "lib/versioneye/models/versionlink.rb",
    "lib/versioneye/package_managers/cocoapods_package_manager.rb",
    "lib/versioneye/package_managers/package_manager.rb",
    "lib/versioneye/parsers/bower_parser.rb",
    "lib/versioneye/parsers/common_parser.rb",
    "lib/versioneye/parsers/composer_lock_parser.rb",
    "lib/versioneye/parsers/composer_parser.rb",
    "lib/versioneye/parsers/gemfile_parser.rb",
    "lib/versioneye/parsers/gemfilelock_parser.rb",
    "lib/versioneye/parsers/gradle_parser.rb",
    "lib/versioneye/parsers/lein_parser.rb",
    "lib/versioneye/parsers/package_parser.rb",
    "lib/versioneye/parsers/parser_strategy.rb",
    "lib/versioneye/parsers/podfile_parser.rb",
    "lib/versioneye/parsers/podfilelock_parser.rb",
    "lib/versioneye/parsers/pom_json_parser.rb",
    "lib/versioneye/parsers/pom_parser.rb",
    "lib/versioneye/parsers/python_setup_parser.rb",
    "lib/versioneye/parsers/requirements_parser.rb",
    "lib/versioneye/parsers/sbt_parser.rb",
    "lib/versioneye/producers/common_producer.rb",
    "lib/versioneye/producers/git_repo_import_producer.rb",
    "lib/versioneye/producers/git_repos_import_producer.rb",
    "lib/versioneye/producers/language_daily_stats_producer.rb",
    "lib/versioneye/producers/process_receipts_producer.rb",
    "lib/versioneye/producers/producer.rb",
    "lib/versioneye/producers/project_update_producer.rb",
    "lib/versioneye/producers/send_notification_emails_producer.rb",
    "lib/versioneye/producers/sync_producer.rb",
    "lib/versioneye/producers/update_dependencies_producer.rb",
    "lib/versioneye/producers/update_index_producer.rb",
    "lib/versioneye/producers/update_meta_data_producer.rb",
    "lib/versioneye/remote_api/me_client.rb",
    "lib/versioneye/remote_api/product_client.rb",
    "lib/versioneye/service.rb",
    "lib/versioneye/services/admin_service.rb",
    "lib/versioneye/services/analytics_service.rb",
    "lib/versioneye/services/bitbucket_service.rb",
    "lib/versioneye/services/circle_element_service.rb",
    "lib/versioneye/services/dependency_service.rb",
    "lib/versioneye/services/email_setting_service.rb",
    "lib/versioneye/services/enterprise_service.rb",
    "lib/versioneye/services/git_hub_service.rb",
    "lib/versioneye/services/http_service.rb",
    "lib/versioneye/services/language_service.rb",
    "lib/versioneye/services/license_service.rb",
    "lib/versioneye/services/license_whitelist_service.rb",
    "lib/versioneye/services/newsletter_service.rb",
    "lib/versioneye/services/notification_service.rb",
    "lib/versioneye/services/product_service.rb",
    "lib/versioneye/services/project_batch_update_service.rb",
    "lib/versioneye/services/project_collaborator_service.rb",
    "lib/versioneye/services/project_import_service.rb",
    "lib/versioneye/services/project_parse_service.rb",
    "lib/versioneye/services/project_service.rb",
    "lib/versioneye/services/project_update_service.rb",
    "lib/versioneye/services/projectdependency_service.rb",
    "lib/versioneye/services/receipt_service.rb",
    "lib/versioneye/services/reference_service.rb",
    "lib/versioneye/services/stash_service.rb",
    "lib/versioneye/services/statistic_service.rb",
    "lib/versioneye/services/submitted_url_service.rb",
    "lib/versioneye/services/sync_service.rb",
    "lib/versioneye/services/user_service.rb",
    "lib/versioneye/services/version_service.rb",
    "lib/versioneye/services_ext/bitbucket.rb",
    "lib/versioneye/services_ext/es_product.rb",
    "lib/versioneye/services_ext/es_user.rb",
    "lib/versioneye/services_ext/github.rb",
    "lib/versioneye/services_ext/mongo_product.rb",
    "lib/versioneye/services_ext/octokit_api.rb",
    "lib/versioneye/services_ext/s3.rb",
    "lib/versioneye/services_ext/stash.rb",
    "lib/versioneye/services_ext/stripe_service.rb",
    "lib/versioneye/updaters/bitbucket_updater.rb",
    "lib/versioneye/updaters/common_updater.rb",
    "lib/versioneye/updaters/github_updater.rb",
    "lib/versioneye/updaters/stash_updater.rb",
    "lib/versioneye/updaters/update_strategy.rb",
    "lib/versioneye/updaters/upload_updater.rb",
    "lib/versioneye/updaters/url_updater.rb",
    "lib/versioneye/version.rb",
    "lib/versioneye/views/feedback_mailer/feedback_email.html.erb",
    "lib/versioneye/views/layouts/email_html_layout.html.erb",
    "lib/versioneye/views/newsletter_mailer/newsletter_new_features_email.html.erb",
    "lib/versioneye/views/notification_mailer/new_version_email.html.erb",
    "lib/versioneye/views/notification_mailer/status.html.erb",
    "lib/versioneye/views/project_mailer/projectnotification_email.html.erb",
    "lib/versioneye/views/project_mailer/projectnotifications_email.html.erb",
    "lib/versioneye/views/receipt/footer.html",
    "lib/versioneye/views/receipt/receipt.html.erb",
    "lib/versioneye/views/receipt_mailer/receipt_email.html.erb",
    "lib/versioneye/views/submitted_url_mailer/approved_url_email.html.erb",
    "lib/versioneye/views/submitted_url_mailer/declined_url_email.html.erb",
    "lib/versioneye/views/submitted_url_mailer/integrated_url_email.html.erb",
    "lib/versioneye/views/submitted_url_mailer/new_submission_email.html.erb",
    "lib/versioneye/views/subscription_mailer/update_subscription.html.erb",
    "lib/versioneye/views/user_mailer/collaboration_invitation.html.erb",
    "lib/versioneye/views/user_mailer/new_collaboration.html.erb",
    "lib/versioneye/views/user_mailer/new_ticket.html.erb",
    "lib/versioneye/views/user_mailer/non_profit_signup.html.erb",
    "lib/versioneye/views/user_mailer/reset_password.html.erb",
    "lib/versioneye/views/user_mailer/suggest_packages_email.html.erb",
    "lib/versioneye/views/user_mailer/test_email.html.erb",
    "lib/versioneye/views/user_mailer/verification_email.html.erb",
    "lib/versioneye/views/user_mailer/verification_email_only.html.erb",
    "lib/versioneye/views/user_mailer/verification_email_reminder.html.erb",
    "lib/versioneye/views/versioncomment_mailer/versioncomment_email.html.erb",
    "lib/versioneye/views/versioncommentreply_mailer/versioncomment_reply_email.html.erb",
    "lib/versioneye/workers/common_worker.rb",
    "lib/versioneye/workers/git_repo_import_worker.rb",
    "lib/versioneye/workers/git_repos_import_worker.rb",
    "lib/versioneye/workers/language_daily_stats_worker.rb",
    "lib/versioneye/workers/process_receipts_worker.rb",
    "lib/versioneye/workers/project_update_worker.rb",
    "lib/versioneye/workers/send_notification_emails_worker.rb",
    "lib/versioneye/workers/sync_worker.rb",
    "lib/versioneye/workers/update_dependencies_worker.rb",
    "lib/versioneye/workers/update_index_worker.rb",
    "lib/versioneye/workers/update_meta_data_worker.rb",
    "lib/versioneye/workers/worker.rb",
    "scripts/minor.sh",
    "scripts/patch.sh",
    "scripts/runntests.sh",
    "spec/fixtures/files/Gemfile",
    "spec/fixtures/files/invoice.pdf",
    "spec/fixtures/files/maven-1.0.1.pom",
    "spec/fixtures/files/pod_file/example1/Podfile",
    "spec/fixtures/files/pod_file/example2/Podfile",
    "spec/fixtures/files/pod_file/more-complex.podfile",
    "spec/fixtures/files/pod_file/target_example1/Podfile",
    "spec/fixtures/files/pod_file/target_example2/Podfile",
    "spec/fixtures/files/pod_file/target_example_3/Podfile",
    "spec/fixtures/files/podfilelock/example1/Podfile.lock",
    "spec/fixtures/files/podfilelock/example2/Podfile.lock",
    "spec/fixtures/files/podspec/AeroGear-Push.podspec",
    "spec/fixtures/files/podspec/Reachability-newer.podspec",
    "spec/fixtures/files/podspec/Reachability.podspec",
    "spec/fixtures/files/podspec/ShareKit.podspec",
    "spec/fixtures/files/podspec/subspec_ex1/RestKit.podspec",
    "spec/fixtures/files/podspec/twitter-text-objc.podspec",
    "spec/fixtures/vcr_cassettes/ProjectUpdateService_update.yml",
    "spec/fixtures/vcr_cassettes/UrlUpdater_update.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_file_import.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_project_file_from_branch.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_project_files_from_branch.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_read_repos.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_repo_branch_tree.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_repo_branches.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_repo_info.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_repo_project_files.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_service_cache_user_invited_repos.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_service_cache_user_repos.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_user.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_user_info.yml",
    "spec/fixtures/vcr_cassettes/bitbucket_user_orgs.yml",
    "spec/fixtures/vcr_cassettes/enterprise_activate_1.yml",
    "spec/fixtures/vcr_cassettes/github_signup.yml",
    "spec/fixtures/vcr_cassettes/github_updater_podfile_1.yml",
    "spec/fixtures/vcr_cassettes/github_updater_pom_xml_1.yml",
    "spec/fixtures/vcr_cassettes/github_updater_pom_xml_2.yml",
    "spec/fixtures/vcr_cassettes/import_from_github.yml",
    "spec/fixtures/vcr_cassettes/sync_product_junit.yml",
    "spec/fixtures/vcr_cassettes/sync_project_log4r.yml",
    "spec/fixtures/vcr_cassettes/versioneye_api_v2_me.yml",
    "spec/spec_helper.rb",
    "spec/versioneye/.DS_Store",
    "spec/versioneye/domain_factories/api_factory.rb",
    "spec/versioneye/domain_factories/billing_address_factory.rb",
    "spec/versioneye/domain_factories/dependency_factory.rb",
    "spec/versioneye/domain_factories/license_factory.rb",
    "spec/versioneye/domain_factories/license_whitelist_factory.rb",
    "spec/versioneye/domain_factories/notification_factory.rb",
    "spec/versioneye/domain_factories/product_factory.rb",
    "spec/versioneye/domain_factories/product_resource_factory.rb",
    "spec/versioneye/domain_factories/project_factory.rb",
    "spec/versioneye/domain_factories/projectdependency_factory.rb",
    "spec/versioneye/domain_factories/receipt_factory.rb",
    "spec/versioneye/domain_factories/stripe_factory.rb",
    "spec/versioneye/domain_factories/stripe_invoice_factory.rb",
    "spec/versioneye/domain_factories/submitted_url_factory.rb",
    "spec/versioneye/domain_factories/user_factory.rb",
    "spec/versioneye/factories/dependency_factory.rb",
    "spec/versioneye/factories/github_repo_factory.rb",
    "spec/versioneye/factories/license_factory.rb",
    "spec/versioneye/factories/newest_factory.rb",
    "spec/versioneye/factories/product_factory.rb",
    "spec/versioneye/factories/project_dependency_factory.rb",
    "spec/versioneye/factories/project_factory.rb",
    "spec/versioneye/factories/user_factory.rb",
    "spec/versioneye/factories/version_factory.rb",
    "spec/versioneye/mailers/feedback_mailer_spec.rb",
    "spec/versioneye/mailers/newsletter_mailer_spec.rb",
    "spec/versioneye/mailers/notification_mailer_spec.rb",
    "spec/versioneye/mailers/project_mailer_spec.rb",
    "spec/versioneye/mailers/receipt_mailer_spec.rb",
    "spec/versioneye/mailers/submitted_url_mailer_spec.rb",
    "spec/versioneye/mailers/subscription_mailer_spec.rb",
    "spec/versioneye/mailers/user_mailer_spec.rb",
    "spec/versioneye/mailers/versioncomment_mailer_spec.rb",
    "spec/versioneye/mailers/versioncommentreply_mailer_spec.rb",
    "spec/versioneye/models/.DS_Store",
    "spec/versioneye/models/api_spec.rb",
    "spec/versioneye/models/auditlog_spec.rb",
    "spec/versioneye/models/billing_address_spec.rb",
    "spec/versioneye/models/circle_element_spec.rb",
    "spec/versioneye/models/dependency_spec.rb",
    "spec/versioneye/models/developer_spec.rb",
    "spec/versioneye/models/email_setting_spec.rb",
    "spec/versioneye/models/error_message_spec.rb",
    "spec/versioneye/models/global_setting_spec.rb",
    "spec/versioneye/models/language_daily_stats_spec.rb",
    "spec/versioneye/models/license_element_spec.rb",
    "spec/versioneye/models/license_spec.rb",
    "spec/versioneye/models/license_whitelist_spec.rb",
    "spec/versioneye/models/maven_repository_spec.rb",
    "spec/versioneye/models/newest_spec.rb",
    "spec/versioneye/models/notification_spec.rb",
    "spec/versioneye/models/np_domain_spec.rb",
    "spec/versioneye/models/product_resource_spec.rb",
    "spec/versioneye/models/product_spec.rb",
    "spec/versioneye/models/product_version_spec.rb",
    "spec/versioneye/models/project_collaborator_spec.rb",
    "spec/versioneye/models/project_dependencies_spec.rb",
    "spec/versioneye/models/project_spec.rb",
    "spec/versioneye/models/projectdependency_spec.rb",
    "spec/versioneye/models/promo_code_spec.rb",
    "spec/versioneye/models/receipt_spec.rb",
    "spec/versioneye/models/reference_spec.rb",
    "spec/versioneye/models/repository_spec.rb",
    "spec/versioneye/models/submitted_url_spec.rb",
    "spec/versioneye/models/user_billing_spec.rb",
    "spec/versioneye/models/user_email_rgx_spec.rb",
    "spec/versioneye/models/user_email_spec.rb",
    "spec/versioneye/models/user_notification_setting_spec.rb",
    "spec/versioneye/models/user_np_domain_spec.rb",
    "spec/versioneye/models/user_spec.rb",
    "spec/versioneye/models/userlinkcollection_spec.rb",
    "spec/versioneye/models/version_spec.rb",
    "spec/versioneye/models/versionarchive_spec.rb",
    "spec/versioneye/models/versioncomment_spec.rb",
    "spec/versioneye/models/versionlink_spec.rb",
    "spec/versioneye/package_managers/cocoapods_package_manager_spec.rb",
    "spec/versioneye/parsers/bower_parser_spec.rb",
    "spec/versioneye/parsers/build_gradle_2_parser_spec.rb",
    "spec/versioneye/parsers/build_gradle_parser_spec.rb",
    "spec/versioneye/parsers/composer_lock_parser_spec.rb",
    "spec/versioneye/parsers/composer_parser_spec.rb",
    "spec/versioneye/parsers/composer_vs_parser_spec.rb",
    "spec/versioneye/parsers/gemfile_line_parser_spec.rb",
    "spec/versioneye/parsers/gemfile_parser_spec.rb",
    "spec/versioneye/parsers/gemfilelock_parser_spec.rb",
    "spec/versioneye/parsers/gradle_2_parser_spec.rb",
    "spec/versioneye/parsers/gradle_parser_spec.rb",
    "spec/versioneye/parsers/lein_parser_spec.rb",
    "spec/versioneye/parsers/package_parser_dev_spec.rb",
    "spec/versioneye/parsers/package_parser_run_dev_spec.rb",
    "spec/versioneye/parsers/package_parser_spec.rb",
    "spec/versioneye/parsers/parser_strategy_spec.rb",
    "spec/versioneye/parsers/podfile_parser_spec.rb",
    "spec/versioneye/parsers/podfilelock_parser_spec.rb",
    "spec/versioneye/parsers/pom_json_parser_spec.rb",
    "spec/versioneye/parsers/pom_parser_spec.rb",
    "spec/versioneye/parsers/python_setup_parser_issue1_spec.rb",
    "spec/versioneye/parsers/python_setup_parser_issue447_spec.rb",
    "spec/versioneye/parsers/python_setup_parser_spec.rb",
    "spec/versioneye/parsers/requirements_parser_spec.rb",
    "spec/versioneye/parsers/sbt_parser_spec.rb",
    "spec/versioneye/remote_api/me_client_spec.rb",
    "spec/versioneye/services/admin_service_spec.rb",
    "spec/versioneye/services/bitbucket_service_spec.rb",
    "spec/versioneye/services/circle_element_service_spec.rb",
    "spec/versioneye/services/dependency_service_spec.rb",
    "spec/versioneye/services/email_setting_service_spec.rb",
    "spec/versioneye/services/enterprise_service_spec.rb",
    "spec/versioneye/services/http_service_spec.rb",
    "spec/versioneye/services/language_service_spec.rb",
    "spec/versioneye/services/license_whitelist_service_spec.rb",
    "spec/versioneye/services/newsletter_service_spec.rb",
    "spec/versioneye/services/notification_service_spec.rb",
    "spec/versioneye/services/product_service_spec.rb",
    "spec/versioneye/services/project_collaborator_service_spec.rb",
    "spec/versioneye/services/project_import_service_spec.rb",
    "spec/versioneye/services/project_service_spec.rb",
    "spec/versioneye/services/project_update_service_spec.rb",
    "spec/versioneye/services/projectdependency_service_spec.rb",
    "spec/versioneye/services/receipt_service_spec.rb",
    "spec/versioneye/services/references_service_spec.rb",
    "spec/versioneye/services/stripe_service_spec.rb",
    "spec/versioneye/services/submitted_url_service_spec.rb",
    "spec/versioneye/services/sync_service_spec.rb",
    "spec/versioneye/services/user_service_spec.rb",
    "spec/versioneye/services/version_service_minimum_stability_spec.rb",
    "spec/versioneye/services/version_service_spec.rb",
    "spec/versioneye/services_ext/bitbucket_spec.rb",
    "spec/versioneye/services_ext/es_product_spec.rb",
    "spec/versioneye/services_ext/github_spec.rb",
    "spec/versioneye/services_ext/mongo_product_spec.rb",
    "spec/versioneye/services_ext/s3_spec.rb",
    "spec/versioneye/updater/bitbucket_updater_spec.rb",
    "spec/versioneye/updater/common_updater_spec.rb",
    "spec/versioneye/updater/github_updater_spec.rb",
    "spec/versioneye/updater/update_strategy_spec.rb",
    "spec/versioneye/updater/upload_updater_spec.rb",
    "spec/versioneye/updater/url_updater_spec.rb",
    "versioneye-core.gemspec"
  ]
  s.homepage = "http://github.com/versioneye/versioneye-core"
  s.licenses = ["private"]
  s.rubygems_version = "2.2.2"
  s.summary = "Models & Services for VersionEye"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<naturalsorter>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<bundler>, ["= 1.7.7"])
      s.add_runtime_dependency(%q<mongoid>, ["~> 3.1.0"])
      s.add_runtime_dependency(%q<log4r>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<dalli>, ["~> 2.7.0"])
      s.add_runtime_dependency(%q<kgio>, ["~> 2.9.0"])
      s.add_runtime_dependency(%q<oauth>, ["~> 0.4.7"])
      s.add_runtime_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_runtime_dependency(%q<stripe>, ["~> 1.14.0"])
      s.add_runtime_dependency(%q<tire>, ["~> 0.6.2"])
      s.add_runtime_dependency(%q<octokit>, ["~> 3.5.2"])
      s.add_runtime_dependency(%q<semverly>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_runtime_dependency(%q<persistent_httparty>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8.0"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<cocoapods-core>, ["~> 0.35.0"])
      s.add_runtime_dependency(%q<actionmailer>, ["~> 3.2.17"])
      s.add_runtime_dependency(%q<pdfkit>, ["~> 0.6.2"])
      s.add_runtime_dependency(%q<bunny>, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<wkhtmltopdf-binary>, ["~> 0.9.9.1"])
      s.add_runtime_dependency(%q<will_paginate_mongoid>, ["= 2.0.1"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<naturalsorter>, ["~> 3.0.0"])
      s.add_dependency(%q<bundler>, ["= 1.7.7"])
      s.add_dependency(%q<mongoid>, ["~> 3.1.0"])
      s.add_dependency(%q<log4r>, ["~> 1.1.0"])
      s.add_dependency(%q<dalli>, ["~> 2.7.0"])
      s.add_dependency(%q<kgio>, ["~> 2.9.0"])
      s.add_dependency(%q<oauth>, ["~> 0.4.7"])
      s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
      s.add_dependency(%q<stripe>, ["~> 1.14.0"])
      s.add_dependency(%q<tire>, ["~> 0.6.2"])
      s.add_dependency(%q<octokit>, ["~> 3.5.2"])
      s.add_dependency(%q<semverly>, ["~> 1.0.0"])
      s.add_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_dependency(%q<persistent_httparty>, ["~> 0.1.0"])
      s.add_dependency(%q<json>, ["~> 1.8.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_dependency(%q<cocoapods-core>, ["~> 0.35.0"])
      s.add_dependency(%q<actionmailer>, ["~> 3.2.17"])
      s.add_dependency(%q<pdfkit>, ["~> 0.6.2"])
      s.add_dependency(%q<bunny>, ["~> 1.6.0"])
      s.add_dependency(%q<wkhtmltopdf-binary>, ["~> 0.9.9.1"])
      s.add_dependency(%q<will_paginate_mongoid>, ["= 2.0.1"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<naturalsorter>, ["~> 3.0.0"])
    s.add_dependency(%q<bundler>, ["= 1.7.7"])
    s.add_dependency(%q<mongoid>, ["~> 3.1.0"])
    s.add_dependency(%q<log4r>, ["~> 1.1.0"])
    s.add_dependency(%q<dalli>, ["~> 2.7.0"])
    s.add_dependency(%q<kgio>, ["~> 2.9.0"])
    s.add_dependency(%q<oauth>, ["~> 0.4.7"])
    s.add_dependency(%q<aws-sdk>, ["~> 1.0"])
    s.add_dependency(%q<stripe>, ["~> 1.14.0"])
    s.add_dependency(%q<tire>, ["~> 0.6.2"])
    s.add_dependency(%q<octokit>, ["~> 3.5.2"])
    s.add_dependency(%q<semverly>, ["~> 1.0.0"])
    s.add_dependency(%q<httparty>, ["~> 0.13.1"])
    s.add_dependency(%q<persistent_httparty>, ["~> 0.1.0"])
    s.add_dependency(%q<json>, ["~> 1.8.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
    s.add_dependency(%q<cocoapods-core>, ["~> 0.35.0"])
    s.add_dependency(%q<actionmailer>, ["~> 3.2.17"])
    s.add_dependency(%q<pdfkit>, ["~> 0.6.2"])
    s.add_dependency(%q<bunny>, ["~> 1.6.0"])
    s.add_dependency(%q<wkhtmltopdf-binary>, ["~> 0.9.9.1"])
    s.add_dependency(%q<will_paginate_mongoid>, ["= 2.0.1"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
  end
end

