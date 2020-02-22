class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully logged in!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update; end

  def destroy; end

  private

  def set_user; end

  def user_params
    params.require(:user).permit(:username, :sirname, :email, :password, :birthday, :gender)
  end
end
