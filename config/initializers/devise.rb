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

  if ENV['CC_ENV'] == 'production'
    client_id = 'ndbbi36k56etdnmdmynb19bntfszgm'
    client_secret = '2mftc8hu241nbn3qi8ra365t9whagp'
    config.omniauth :twitch, client_id, client_secret, scope:['user:edit', 'user:read:email']
  elsif ENV['CC_ENV'] == 'development'
    client_id = 'uuq05yn3ai22vqcdzqhvqzi14l0pra'
    client_secret = '84o24kxg50hhg2nyilrx8wy5yj1l1n'
    config.omniauth :twitch, client_id, client_secret, scope:['user:edit', 'user:read:email']
  else # localhost
    client_id = 'mx4pqqjw18td29vbekx8qs23vbvfsf'
    client_secret = '6se4tsukexxgcnad2zlmsca0czrtzx'
    config.omniauth :twitch, client_id, client_secret, scope:"user:read:email", client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt' } }
  end

end
