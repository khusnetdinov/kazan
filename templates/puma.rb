workers Integer(ENV.fetch('PUMA_WORKERS'))
threads_count = Integer(ENV.fetch('PUMA_THREADS'))
threads(threads_count, threads_count)

preload_app!

rackup DefaultRackup
environment String(ENV.fetch('RACK_ENV', 'development'))

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  # ActiveRecord::Base.establish_connection
end
