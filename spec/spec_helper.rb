require 'bundler/setup'

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.include KazanSpecHelpers
end
