class SessionsController < ApplicationController
  before_action :redirect, only: [:new, :create]

  def redirect
    redirect_to cats_url if current_user
  end

  def new
  end

  def create
    login_user!
  end

  def destroy
    if current_user
      current_user.reset_session_token!
    end
    session[:session_token] = nil
    redirect_to cats_url
  end
end
