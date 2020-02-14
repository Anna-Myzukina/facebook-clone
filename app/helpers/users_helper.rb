module UsersHelper
  def friendship(user)
    Friendship.find_by(user_id: user.id, friend_id: current_user.id)
  end

  def friendships
    current_user.friendships.map(&:friend)
  end

  def expected_friend
    current_user.inverse_friendships.reject(&:confirmed).map(&:user)
  end

  def pending_friend
    current_user.friendships.reject(&:confirmed).map(&:friend)
  end

  def accepted_friend
    accepted = current_user.friendships.select(&:confirmed).map(&:friend)
    accepted + current_user.inverse_friendships.select(&:confirmed).map(&:user)
  end
end
