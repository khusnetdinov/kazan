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

    def exception_on_delivery_errors
     replace_in_file 'config/environments/development.rb',
       'raise_delivery_errors = false', 'raise_delivery_errors = true'
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

    def exception_on_missing_assets_in_test
      configure_environment 'test', 'config.assets.raise_runtime_errors = true'
    end

    def spring
      bundle_command 'exec spring binstub --all'
    end
  end
end
