class TwitterController < ApplicationController
  # Public: Called when user is redirected back from Twitter. Finds or creates
  # user using attributes from the omniauth object. Sets current_user and then
  # redirects to root_path.
  def callback
    user = User.from_omniauth(omniauth)
    self.current_user = user

    redirect_to root_path
  end
end
