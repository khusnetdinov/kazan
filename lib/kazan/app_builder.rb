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

    def setup_spring
      bundle_command 'exec spring binstub --all'
    end

    def setup_rack_mini_profiler
      copy_file 'rack_mini_profiler.rb', 'config/initializers/rack_mini_profiler.rb'
    end
  end
end
