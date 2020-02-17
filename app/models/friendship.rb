class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def confirm_friend
    return if confirmed

    update(confirmed: true)
    Friendship.create(user_id: friend_id, friend_id: user_id, confirmed: true)
  end

  def destroy_friendship
    destroy_mutual if confirmed
    destroy
  end

  private

  def destroy_mutual
    Friendship.where('user_id = ? AND friend_id = ?',
                     friend.id, user.id).each(&:destroy)
  end

  def friend_cannot_be_user
    errors.add(:invalid_friendship, "can't be friend with same user") if user_id == friend_id
  end
end
