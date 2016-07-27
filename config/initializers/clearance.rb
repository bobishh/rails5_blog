Clearance.configure do |config|
  config.allow_sign_up = false
  config.cookie_domain = '.eternalvoid.me'
  config.cookie_expiration = ->(_cookies) { 1.year.from_now.utc }
  config.cookie_name = 'eternal_mystical_cookie'
  config.cookie_path = '/'
  config.routes = true
  config.httponly = false
  config.mailer_sender = 'do-not-reply@eternalvoid.me'
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = '/'
  config.secure_cookie = false
  config.sign_in_guards = []
  config.user_model = User
end
