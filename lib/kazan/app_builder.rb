module Kazan
  class AppBuilder < Rails::AppBuilder
    include Kazan::Actions

    def readme
      template 'README.md.erb', 'README.md'
    end

    def gitignore
      copy_file 'project_gitignore', '.gitignore', force: true
    end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    def gemfile_api
      template 'Gemfile.api.erb', 'Gemfile', force: true
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

    def shared_views_directory
      empty_directory 'app/views/layouts/shared'
    end

    def shared_flash
      copy_file '_flashes.html.erb', 'app/views/layouts/shared/_flashes.html.erb'
      copy_file 'flashes_helper.rb', 'app/helpers/flashes_helper.rb'
    end

    def shared_javascript
      copy_file '_javascript.html.erb', 'app/views/layouts/shared/_javascript.html.erb'
    end

    def shared_styles
      copy_file '_styles.html.erb', 'app/views/layouts/shared/_styles.html.erb'
    end

    def shared_layout
      copy_file '_application.html.erb', 'app/views/layouts/application.html.erb', force: true
    end

    def assets_config
      copy_file 'errors.rb', 'config/initializers/errors.rb'
      copy_file 'json_encoding.rb', 'config/initializers/json_encoding.rb'
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

    def remove_turbolinks
      replace_in_file(
        "app/assets/javascripts/application.js",
        "//= require turbolinks",
        "")
    end

    def stylesheets_gems
      gems = <<-RUBY
      RUBY

      inject_into_file 'Gemfile', gems,
        after: "gem 'sass-rails', '~> 5.0'\n"

      Bundler.with_clean_env { run 'bundle install' }
    end

    def stylesheets_manifest
      remove_file 'app/assets/stylesheets/application.css'
      copy_file(
        'application.scss',
        'app/assets/stylesheets/application.scss',
        force: true)
    end

    def static_pages
      meta_tags = <<-EOS
    <meta charset="utf-8" />
    <meta name="ROBOTS" content="NOODP" />
    <meta name="viewport" content="initial-scale=1" />
      EOS

      %w(500 404 422).each do |page|
        inject_into_file "public/#{page}.html", meta_tags, after: "<head>\n"
        replace_in_file "public/#{page}.html", /<!--.+-->\n/, ''
      end
    end

    def setup_locales
      copy_file 'i18n-tasks.yml', 'config/i18n-tasks.yml'
      copy_file 'i18n_spec.rb', 'spec/i18n_spec.rb'
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

    def rspec_config
      generate 'rspec:install'
    end

    def rspec_replace_config
      copy_file 'rails_helper.rb', 'spec/rails_helper.rb', force: true
      copy_file 'spec_helper.rb', 'spec/spec_helper.rb', force: true
    end

    def smtp_config
      copy_file 'smtp.rb', 'config/smtp.rb'

      prepend_file 'config/environments/production.rb',
        %{require Rails.root.join("config/smtp")\n}

      config = <<-RUBY
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = SMTP_SETTINGS

      RUBY

      inject_into_file 'config/environments/production.rb', config,
        after: "config.action_mailer.raise_delivery_errors = false"
    end

    def rack_timeout_config
      rack_timeout_config = <<-RUBY
  Rack::Timeout.timeout = (ENV["RACK_TIMEOUT"] || 10).to_i

      RUBY

      append_file 'config/environments/production.rb', rack_timeout_config
    end

    def rack_canonical_host_config
      config = <<-RUBY
  config.middleware.use Rack::CanonicalHost, ENV.fetch("APPLICATION_HOST")
      RUBY

      inject_into_file "config/environments/production.rb", config,
        after: "Rails.application.configure do"
    end

    def rack_deflater_config
      configure_environment "production", "config.middleware.use Rack::Deflater"
    end

    def rollbar_config
      copy_file 'rollbar.rb', 'config/initializers/rollbar.rb'
    end

    def spring
      bundle_command 'exec spring binstub --all'
    end

    def empty_directories
      [
        'app/assets/fonts',
        'app/controllers/api',
        'app/controllers/web',
        'app/services',
        'app/policies',
        'app/validations',
        'app/views/shared',
        'spec/controllers',
        'spec/factories',
        'spec/helpers',
        'spec/models',
        'spec/mailers',
        'spec/requests',
        'spec/routing',
      ].each do |dir|
        empty_directory_with_keep_file dir
      end
    end

    def init_commit
      run 'git init'
      run 'git add .'
      run 'git commit -m "Init commit"'
    end

    private

    def exception_on_missing_translations_in(environment)
      config = 'config.action_view.raise_on_missing_translations = true'

      uncomment_lines("config/environments/#{environment}.rb", config)
    end
  end
end
