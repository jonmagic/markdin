require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def omniauth_hash
    {
      "uid" => "1234567890",
      "info" => {
        "nickname" => "jonmagic"
      },
      "credentials" => {
        "token" => "abcd1234",
        "secret" => "abcd1234"
      }
    }
  end

  test "#from_omniauth finds user if user exists" do
    user = User.create! do |u|
      u.username = "jonmagic"
      u.uid      = "1234567890"
      u.token    = "abcd1234"
      u.secret   = "abcd1234"
    end

    assert_equal user, User.from_omniauth(omniauth_hash)
  end

  test "#from_omniauth creates user if user does not exist" do
    User.from_omniauth(omniauth_hash)

    assert_equal User.first, User.from_omniauth(omniauth_hash)
  end

  test "#create_from_omniauth creates User from omniauth hash" do
    assert_equal 0, User.count

    User.create_from_omniauth(omniauth_hash)

    assert_equal 1, User.count
  end
end
