class User < ActiveRecord::Base
  # Public: Twitter username.
  # column :username
  # Returns a String.
  validates :username, :presence => true

  # Public: Twitter uid.
  # column :uid
  # Returns a String.
  validates :uid, :presence => true

  # Public: Twitter access token.
  # column :token
  # Returns a String.
  validates :token, :presence => true

  # Public: Twitter access secret.
  # column :secret
  # Returns a String.
  validates :secret, :presence => true
end
