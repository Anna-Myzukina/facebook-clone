class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friend Request Sent.'
      redirect_to root_url
    else
      flash[:error] = 'Unable to add friend.'
    end
  end

  def destroy
    @friendship = friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to users_path
  end
end
