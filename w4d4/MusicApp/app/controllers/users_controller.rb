class UsersController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    # debugger
    if user.save
      log_in(user)
      redirect_to user_url(user.id)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
