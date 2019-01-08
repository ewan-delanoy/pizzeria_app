Recaptcha.configure do |config|
  config.site_key= ENV['GOOGLE_RECAPTCHA_PUBLISHABLE_KEY']
  config.secret_key= ENV['GOOGLE_RECAPTCHA_SECRET_KEY']
end
