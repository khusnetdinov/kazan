# frozen_string_literal: true

module Kazan
  VERSION = '0.5.0'
  RAILS_VERSION = '5.2.0'
  RAILS_I18N_VERSION = '~> 5.1'
  RUBY_PROJECT_VERSION = IO.read("#{File.dirname(__FILE__)}/../../.ruby-version").strip
end
