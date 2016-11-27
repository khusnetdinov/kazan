module Kazan
  VERSION = '0.3.0'.freeze
  RAILS_VERSION = '~> 5.0.0'.freeze
  RUBY_PROJECT_VERSION = IO.read("#{File.dirname(__FILE__)}/../../.ruby-version").strip.freeze
end
