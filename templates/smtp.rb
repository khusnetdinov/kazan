SMTP_SETTINGS = {
  address: String(ENV.fetch('SMTP_ADDRESS')), # example: 'smtp.sendgrid.net'
  authentication: :plain,
  domain: String(ENV.fetch('SMTP_DOMAIN')),   # example: 'heroku.com'
  enable_starttls_auto: true,
  password: String(ENV.fetch('SMTP_PASSWORD')),
  port: '587',
  user_name: String(ENV.fetch('SMTP_USERNAME'))
}

if ENV['EMAIL_RECIPIENTS'].present?
    Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])
end

