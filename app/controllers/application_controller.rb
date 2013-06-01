class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Render the homepage.
  def homepage; end

  # Public: The currently signed in user or nil.
  #
  # Returns a User or NilClass.
  def current_user
    nil
  end
  helper_method :current_user
end
