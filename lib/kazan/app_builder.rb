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

    def rack_mini_profiler
      copy_file 'rack_mini_profiler.rb', 'config/initializers/rack_mini_profiler.rb'
    end

    def puma_configuration
      copy_file 'puma.rb', 'config/puma.rb', force: true
    end

    def postgres_config
      template 'database.yml.erb', 'config/database.yml', force: true
      template 'database.yml.erb', 'config/database.yml.example'
    end

    def database_tables
      bundle_command 'exec rake db:create db:migrate'
    end

    def spring
      bundle_command 'exec spring binstub --all'
    end
  end
end
