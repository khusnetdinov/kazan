# frozen_string_literal: true

module Kazan
  VERSION = '0.6.0'
  RAILS_VERSION = '~> 7.0.0'
  RAILS_I18N_VERSION = '7.0.5'
  RUBY_PROJECT_VERSION = IO.read("#{File.dirname(__FILE__)}/../../.ruby-version").strip
end
