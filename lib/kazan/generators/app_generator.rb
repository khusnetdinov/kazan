require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kazan
  class AppGenerator < Rails::Generators::AppGenerator
    hide!

    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Configure for selected database (options: #{DATABASES.join("/")})"

    class_option :skip_test, type: :string, default: '--skip-test-unit'

    def finish_template
      invoke :customization
      super
    end

    def customization
      invoke :setup_ruby
      invoke :setup_gems
      invoke :setup_secrets
      invoke :setup_development_environment
      invoke :setup_test_environment
      # invoke :setup_production_environment
      invoke :setup_database
      # invoke :setup_assets
      # invoke :setup_miscellaneous_files
      # invoke :setup_views
      # invoke :setup_error_pages
      # invoke :setup_routes
      # invoke :setup_git
      # invoke :setup_project_repository
      invoke :setup_bundler_audit
      invoke :setup_spring
      invoke :outro
    end

    def setup_ruby
      say 'Setup ruby'
      build :ruby_version
    end

    def setup_gems
      say 'Setup gems'
      build :puma_config

      unless options[:api]
        build :simple_form_config
        build :rack_mini_profiler_config
      end
    end

    def setup_secrets
      say 'Setup secrets'
      build :dotenvs
      build :settings
    end

    def setup_development_environment
      say 'Setup development environment'
      build :exception_on_delivery_errors
      build :exception_on_unpermitted_parameters
      build :exception_on_missing_translations
      build :letter_opener_config
      build :bullet_config
      build :foreman_config
      build :rails_generators_config

      unless options[:api]
        build :quiet_assets_config
      end
    end

    def setup_test_environment
      say 'Setup test environment'
      build :exception_on_missing_assets_in_test
      build :spec_translations_config
      build :spec_action_mailer_config
      build :spec_database_cleaner_config
      build :spec_shoulda_matchers_config
      build :spec_factory_girl_config
    end

    def setup_database
      say 'Setup database'
      build :postgres_config if options[:database] == 'postgresql'
      build :database_tables
    end

    def setup_bundler_audit
      say 'Setup bundler audit'
      build :bundler_audit_config
    end

    def setup_spring
      say 'Setup spring binstubs'
      build :spring
    end

    def outro
      say 'Last preparation'
    end

    protected

    def get_builder_class
      Kazan::AppBuilder
    end
  end
end
