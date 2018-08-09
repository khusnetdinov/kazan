# frozen_string_literal: true

workers Integer(ENV.fetch('PUMA_WORKERS', 2))
threads_count = Integer(ENV.fetch('PUMA_THREADS', 2))
threads(threads_count, threads_count)

preload_app!

rackup DefaultRackup
environment ENV.fetch('RACK_ENV', 'development')

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  # ActiveRecord::Base.establish_connection
end
