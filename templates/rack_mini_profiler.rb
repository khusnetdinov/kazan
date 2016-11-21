if Integer(ENV.fetch('RACK_MINI_PROFILER')) > 0
  # Before uncomment read https://github.com/MiniProfiler/rack-mini-profiler#rails-and-manual-initialization
  require 'rack-mini-profiler'

  Rack::MiniProfilerRails.initialize!(Rails.application)
end
