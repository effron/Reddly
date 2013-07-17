class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to links_url
    else
      set_flash_errors "Invalid Username or Password"
      render :new
    end
  end

  def destroy
    @user.find(params[:id])
    @user.destroy
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end