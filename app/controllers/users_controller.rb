class UsersController < ApplicationController

  before_action :check_login, only: [:index, :show, :update, :destroy]

  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
      flash[:notice] = "User created successfully"
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end