class User < ActiveRecord::Base
  # Public: Find or create user with omniauth attributes.
  #
  # omniauth - Omniauth Hash.
  #
  # Returns a User.
  def self.from_omniauth(omniauth)
    where(:uid => omniauth["uid"]).first || create_from_omniauth(omniauth)
  end

  # Internal: Create user from omniauth attributes.
  #
  # omniauth - Omniauth Hash.
  #
  # Returns a User.
  def self.create_from_omniauth(omniauth)
    create! do |user|
      user.uid      = omniauth["uid"]
      user.username = omniauth["info"]["nickname"]
      user.token    = omniauth["credentials"]["token"]
      user.secret   = omniauth["credentials"]["secret"]
    end
  end

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
