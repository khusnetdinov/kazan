module Kazan
  class AppBuilder < Rails::AppBuilder
    include Kazan::Actions

    def readme
      template 'README.md.erb', 'README.md'
    end

    def gitignore
      copy_file 'gitignore', '.gitignore'
    end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    def ruby_version
      create_file '.ruby-version', "#{Kazan::RUBY_PROJECT_VERSION}\n"
    end

    def simple_form_config
      bundle_command 'exec rails generate simple_form:install'
    end

    def rack_mini_profiler_config
      copy_file 'rack_mini_profiler.rb', 'config/initializers/rack_mini_profiler.rb'
    end

    def puma_config
      copy_file 'puma.rb', 'config/puma.rb', force: true
    end

    def postgres_config
      template 'database.yml.erb', 'config/database.yml', force: true
      template 'database.yml.erb', 'config/database.yml.example'
    end

    def database_tables
      bundle_command 'exec rake db:create db:migrate'
    end

    def dotenvs
      directory 'envs', '.'
    end

    def settings
      template 'settings.yml.erb', 'config/settings.yml'
    end

    def exception_on_delivery_errors
     replace_in_file 'config/environments/development.rb',
       'raise_delivery_errors = false', 'raise_delivery_errors = true'
    end

    def exception_on_unpermitted_parameters
      config = <<-RUBY
    config.action_controller.action_on_unpermitted_parameters = :raise

      RUBY

      inject_into_class 'config/application.rb', 'Application', config
    end

    def exception_on_missing_translations
      exception_on_missing_translations_in 'development'
      exception_on_missing_translations_in 'test'
    end

    def letter_opener_config
      letter_opener_settings = <<-RUBY
  # Letter opener settings
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :letter_opener
      RUBY

      configure_environment 'development', letter_opener_settings
    end

    def bullet_config
      template 'bullet.rb', 'config/initializers/bullet.rb'
    end

    def quiet_assets_config
      config = <<-RUBY
    config.assets.quiet = true

      RUBY

      inject_into_class 'config/application.rb', 'Application', config
    end

    def foreman_config
      template 'Procfile.erb', 'Procfile'
    end

    def rails_generators_config
      config = <<-RUBY
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end

      RUBY

      inject_into_class 'config/application.rb', 'Application', config
    end

    def bundler_audit_config
      copy_file 'bundler_audit.rake', 'lib/tasks/bundler_audit.rake'
      append_file 'Rakefile', %{\ntask default: 'bundler:audit'\n}
    end

    def exception_on_missing_assets_in_test
      configure_environment 'test', 'config.assets.raise_runtime_errors = true'
    end

    def spec_translations_config
      copy_file 'i18n.rb', 'spec/support/i18n.rb'
    end

    def spec_action_mailer_config
      copy_file 'action_mailer.rb', 'spec/support/action_mailer.rb'
    end

    def spec_database_cleaner_config
      copy_file 'database_cleaner.rb', 'spec/support/database_cleaner.rb'
    end

    def spec_shoulda_matchers_config
      copy_file 'shoulda_matchers.rb', 'spec/support/shoulda_matchers.rb'
    end

    def spec_factory_girl_config
      copy_file 'factory_girl.rb', 'spec/support/factory_girl.rb'
    end

    def spring
      bundle_command 'exec spring binstub --all'
    end

    private

    def exception_on_missing_translations_in(environment)
      config = 'config.action_view.raise_on_missing_translations = true'

      uncomment_lines("config/environments/#{environment}.rb", config)
    end
  end
end
