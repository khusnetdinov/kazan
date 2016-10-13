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
      invoke :setup_ruby
      invoke :setup_gems
      invoke :setup_secrets
      invoke :setup_development_environment
      # invoke :setup_test_environment
      # invoke :setup_production_environment
      invoke :setup_database
      # invoke :setup_assets
      # invoke :setup_miscellaneous_files
      # invoke :setup_views
      # invoke :setup_error_pages
      # invoke :setup_routes
      # invoke :setup_git
      # invoke :setup_project_repository
      # invoke :setup_bundler_audit
      invoke :setup_spring
      # invoke :outro
    end

    def setup_ruby
      say 'Setup ruby'
      build :ruby_version
    end

    def setup_gems
     say 'Setup gems'
     build :simple_form_config
     build :rack_mini_profiler_config
     build :puma_config
    end

    def setup_secrets
      say 'Setup secrets'
      build :dotenvs
    end

    def setup_development_environment
      say 'Setup development environment'
      build :exception_on_delivery_errors
      build :letter_opener_config
      build :bullet_config
    end

    def setup_test_environment
      say 'Setup development test'
      build :exception_on_missing_assets_in_test
    end

    def setup_database
      say 'Setup database'
      build :postgres_config if options[:database] == 'postgresql'
      build :database_tables
    end

    def setup_spring
      say 'Setup spring binstubs'
      build :spring
    end

    protected

    def get_builder_class
      Kazan::AppBuilder
    end
  end
end
