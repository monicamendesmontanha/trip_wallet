class UsersController < ApplicationController
  before_action :check_admin!

  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_path
    else
      render :signup
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
