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
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  # Internal: Set the currently logged in user for request and session.
  def current_user=(user)
    if user.present?
      set_current_user_for_request_and_session(user)
    else
      clear_current_user_for_request_and_session
    end
  end

  # Internal: Set the currently logged in user for request and session.
  def set_current_user_for_request_and_session(user)
    @current_user = user
    session[:user_id] = user.id
  end

  # Internal: Clear the current user for request and session.
  def clear_current_user_for_request_and_session
    @current_user = nil
    session[:user_id] = nil
  end

  # Internal: The omniauth hash from the request env.
  #
  # Returns a Hash.
  def omniauth
    request.env['omniauth.auth']
  end
end
