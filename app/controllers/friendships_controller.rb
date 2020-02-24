class FriendshipsController < ApplicationController
  before_action :check_user

  def index
    @friends = current_user.friends
    @friend_request = current_user.friend_requests
  end

  def create
    new_friend = User.find(params[:user_id])
    current_user.send_request(new_friend)
    redirect_back(fallback_location: root_path)
  end

  def update
    my_friend = User.find(params[:user_id])
    current_user.confirm_friend(my_friend)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    @connection = Friendship.where('user_id = ? and friend_id = ?', current_user.id, user.id).first
    @inverse_connection = Friendship.where('user_id = ? and friend_id = ?', user.id, current_user.id).first
    if @connection
      @connection.destroy
      @inverse_connection&.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def check_user
    @user = User.find_by(id: params[:user_id])
    return unless @user.nil?

    flash[:danger] = "Internal error: user doesn't exist"
    redirect_back(fallback_location: root_path)
  end
end
