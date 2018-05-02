module Kazan
  VERSION = '0.5.0'.freeze
  RAILS_VERSION = '5.2.0'.freeze
  RAILS_I18N_VERSION = '~> 5.1'.freeze
  RUBY_PROJECT_VERSION = IO.read("#{File.dirname(__FILE__)}/../../.ruby-version").strip.freeze
end
