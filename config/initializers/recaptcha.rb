Recaptcha.configure do |config|
  config.public_key  = ENV['GOOGLE_RECAPTCHA_PUBLISHABLE_KEY']
  config.private_key = ENV['GOOGLE_RECAPTCHA_SECRET_KEY']
end
