if Rails.env == 'development' || Rails.env == 'staging'
  require 'rack_mini_profiler'

  Rack::MiniProfilerRails.initialize!(Rails.application)
end
