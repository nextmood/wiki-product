# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wiki-product_session',
  :secret      => '5d498720a7c85c7ece7831f20200697b733b544574731ccd19a9aafddd41e58b09fb43cc58460cc06f09605c14c33fc1e835736dd4772ccee8845c300a65a6fb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
