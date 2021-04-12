# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.office365.com',
    port:                 587,
    authentication:       :plain,
    user_name:            ENV["MAILER_USERNAME"],
    password:             ENV["MAILER_PASSWORD"],
    enable_starttls_auto: true
  }
end

# Initialize the Rails application.
Rails.application.initialize!
