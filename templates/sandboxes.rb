module Rails
  class Server
    REQUIRED_ENVS_VARIABLES = [
      "RACK_ENV",
      "RACK_TIMEOUT",
      "SECRET_KEY_BASE",
      "DATABASE_TIMEOUT",
      "DATABASE_POOL",
      "DATABASE_USERNAME",
      "DATABASE_PASSWORD",
      "DATABASE_URL",
      "PUMA_WORKERS",
      "PUMA_THREADS",
      "SMTP_ADDRESS",
      "SMTP_DOMAIN",
      "SMTP_PASSWORD",
      "SMTP_USERNAME",
      "APPLICATION_HOST",
      "ROLLBAR_TOCKEN",
      "ROLLBAR_ENV",
    ]

    def initialize(*)
      super
      set_environment
      production_envs_variables_present?
    end

    private

    def production_envs_variables_present?
      if Rails.env.production?
        exit unless required_envs_variables_present?
      end
    end

    def required_envs_variables_present?
      REQUIRED_ENVS_VARIABLES.each do |env|
        unless ENV.include? env
          puts "Please provide ENV['#{env}']"
          false
        end
      end
      true
    end
  end
end
