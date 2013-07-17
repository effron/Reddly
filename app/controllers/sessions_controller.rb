class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to @user
    else
      set_flash_errors "Invalid username or password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end