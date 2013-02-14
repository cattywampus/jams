ActionMailer::Base.smtp_settings = {
  :address => ENV["MAILER_SMTP_ADDRESS"],
  :port => 587,
  :user_name => ENV["MAILER_USERNAME"],
  :password => ENV["MAILER_PASSWORD"],
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
