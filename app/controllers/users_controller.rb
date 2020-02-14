class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully logged in!'
      redirect_to posts_path
    else
      render 'new'
    end
  end
  def request_friend
    @friendship = current_user.friendships.build(friend_id: params[:id])
    if @friendship.save
      flash.notice = 'Friend request sent'
    else
      flash.alert = 'Failed to send request'
    end
    redirect_to users_path
  end

  def accept_friend
    friend = Friendship.find_by(id: params[:id])
    debugger
    @friendship = friend.build(confirmed: true)
    if @friendship
      flash.notice = 'Friend accepted'
    else
      flash.alert = 'Failed to accept request'
    end
    redirect_to users_path
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update; end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user; end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :sirname, :email, :password, :birthday, :gender)
  end
end
