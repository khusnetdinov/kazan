require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kazan
  class AppGenerator < Rails::Generators::AppGenerator
    hide!

    def finish_template
      invoke :customization
      super
    end

    def customization
      invoke :setup_spring

    end

    def setup_spring
      say "Setup spring binstubs"
      build :setup_spring

    end

    protected

    def get_builder_class
      Kazan::AppBuilder
    end
  end
end
