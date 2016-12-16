class SessionsController < ApplicationController

  def new

    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      log_in(user)
      redirect_to cats_url
    else
      flash[:message] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    log_out if current_user
    redirect_to new_session_url
  end
end
