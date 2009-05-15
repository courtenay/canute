# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_canute_session',
  :secret      => 'a766c85feb6df575b51d7a5782b2b13e035dc27b6660faecd6cc9757c60dbaa530e288a12c8f57b1f8f956175f4c076d47b317413dff9550149ce482137a91a7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
