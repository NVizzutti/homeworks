class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    User.find_by_session_token(session[:session_token])
  end

  def login_user!
    username = params[:user][:user_name]
    password = params[:user][:password]
    user = User.find_by_credentials(username, password)
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      render :new
    end
  end
end
