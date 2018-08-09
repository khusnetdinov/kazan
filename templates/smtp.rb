# frozen_string_literal: true

SMTP_SETTINGS = {
  address: ENV.fetch('SMTP_ADDRESS'), # example: 'smtp.sendgrid.net'
  authentication: :plain,
  domain: ENV.fetch('SMTP_DOMAIN'),   # example: 'heroku.com'
  enable_starttls_auto: true,
  password: ENV.fetch('SMTP_PASSWORD'),
  port: '587',
  user_name: ENV.fetch('SMTP_USERNAME')
}.freeze

if ENV['EMAIL_RECIPIENTS'].present?
  Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])
end

