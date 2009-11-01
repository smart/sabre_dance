# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sabre_dance_session',
  :secret      => '6c5dbb5fe19280272af0e5aa5aa90dd8fcd6c6ed8b4c7acc3f754eb082ec54419b3e5807308cd8f785ecd0903ab6a576511346946238f96a6d1b281931a9475d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
