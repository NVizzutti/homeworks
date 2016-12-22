class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:users][:email], params[:users][:password])
    if user
      log_in(user)
      redirect_to user_url(user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    if current_user
      current_user.session_token = current_user.generate_session_token
      current_user.save
    end
    redirect_to new_session_url
  end
end
