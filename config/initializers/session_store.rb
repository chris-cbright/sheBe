# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blog.cbright.co.uk_session',
  :secret      => '9a2ebf5fd338e3f06ff0aba3919a2578c269de72d51de77fa648bf52ae86bf71f32540752c0dc31676071d1357580df284138806a4b527db2ddeeb29dd886848'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
