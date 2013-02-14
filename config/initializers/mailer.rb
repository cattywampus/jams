ActionMailer::Base.smtp_settings = {
  :address => ENV["MAILER_SMTP_ADDRESS"],
  :port => 587,
  :user_name => ENV["MAILER_USERNAME"],
  :password => ENV["MAILER_PASSWORD"],
  :authentication => :login,
  :enable_starttls_auto => false,
  :openssl_verify_mode => false
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
