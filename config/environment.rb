# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    # address:              'smtp.office365.com',
    # address:              'smtp.gmail.com',
    # address:              'smtp-mail.outlook.com',

    address:              'smtp.qq.com',
    port:                 587,
    authentication:       :plain,
    user_name:            ENV["MAILER_USERNAME"],
    password:             ENV["MAILER_PASSWORD"],
    enable_starttls_auto: true
  }

  config.active_record.cache_versioning = false
  config.cache_store = :redis_store, (ENV['REDIS_CACHE_URL'] || '').split(','), {expires_in: 90.minutes}
  config.session_store :redis_store, servers: (ENV['REDIS_SESSION_URL'] || '').split(','), expire_after: 90.minutes, key: '_wk_session'
end

# Initialize the Rails application.
Rails.application.initialize!
