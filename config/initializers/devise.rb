Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email, :name]
  config.strip_whitespace_keys = [:email, :name]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..32
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  client_id = ENV['TWITCH_CLIENT_ID'] || 'd755yfd6jecj9e8j6bpdqgq7d883z9'
  client_secret = ENV['TWITCH_CLIENT_SECRET'] || 'qvvgsw2iki4wxz3kckvr92ke7fm5tw'
  config.omniauth :twitch, client_id, client_secret, scope:"user:read:email", client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt' } }

end
