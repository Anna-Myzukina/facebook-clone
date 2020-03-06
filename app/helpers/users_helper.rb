module UsersHelper
  def user_status(user)
    return if current_user == user

    if current_user.friend?(user)
      # "#{user.username} is one of my friend"
      link_to 'Unfriend', user_reject_request_path(user), method: :delete, class: 'btn btn-danger mb-2'
    elsif current_user.pending_friendship.include?(user)
      link_to 'Cancel request', user_reject_request_path(user), method: :delete, class: 'btn btn-danger mb-2'
    elsif current_user.friendship_requests.include?(user)
      (button_to 'Accept friend request', user_accept_request_path(user), class: 'btn btn-primary mr-2')
    else
      link_to 'Add new friend', user_friendships_path(user), method: :post, class: 'btn btn-info mb-2'
    end
  end
end
