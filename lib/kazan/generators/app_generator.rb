require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kazan
  class AppGenerator < Rails::Generators::AppGenerator
    hide!

    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Configure for selected database (options: #{DATABASES.join("/")})"

    def finish_template
      invoke :customization
      super
    end

    def customization
      # invoke :setup_gemfile
      # invoke :setup_development_environment
      # invoke :setup_test_environment
      # invoke :setup_production_environment
      # invoke :setup_secret_token
      # invoke :setup_views
      # invoke :setup_app
      # invoke :setup_miscellaneous_files
      # invoke :setup_error_pages
      # invoke :setup_config
      # invoke :setup_routes
      # invoke :setup_git
      invoke :setup_database
      # invoke :setup_project_repository
      # invoke :setup_segment
      # invoke :setup_bundler_audit
      invoke :setup_spring
      # invoke :setup_default
      # invoke :outro
    end

    def setup_gemfile
    end

    def setup_development_environment
    end

    def setup_test_environment
    end

    def setup_production_environment
    end

    def setup_secret_token
    end

    def setup_views
    end

    def setup_app
      say 'Setup application'
      build :rack_mini_profiler
    end

    def setup_miscellaneous_files
    end

    def setup_error_pages
    end

    def setup_config
    end

    def setup_routes
    end

    def setup_git
    end

    def setup_database
      say 'Setup database'
      build :postgres_config if options[:database] == 'postgresql'
      build :database_tables
    end

    def setup_project_repository
    end

    def setup_segment
    end

    def setup_bundler_audit
    end

    def setup_spring
      say 'Setup spring binstubs'
      build :spring
    end

    def setup_default
    end

    def outro
    end

    protected

    def get_builder_class
      Kazan::AppBuilder
    end
  end
end
