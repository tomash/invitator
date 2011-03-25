def load_config(file)
  data = YAML.load(File.read(File.join(Rails.root, "config", file+".yml")))
  data[Rails.env]
end

APP_CONFIG = load_config("application")

ActionMailer::Base.smtp_settings = APP_CONFIG["smtp_settings"].symbolize_keys
ActionMailer::Base.default_url_options[:host] = APP_CONFIG["host"]

Devise.setup do |config|
  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in DeviseMailer.
  config.mailer_sender = APP_CONFIG["smtp_settings"]["from"]
end
