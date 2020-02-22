module UsersHelper
  def user_status(user)
    return if current_user == user

    if current_user.friend?(user)
      "#{user.username} is one of my friend"
      button_to 'Unfriend', user_reject_request_path(user), method: :delete, class: 'btn btn-danger mb-2'
    elsif current_user.pending_friends.include?(user)
      button_to 'Cancel request', user_reject_request_path(user), method: :delete, class: 'btn btn-danger mb-2'
    elsif current_user.friend_requests.include?(user)
      button = (button_to 'Accept', user_accept_request_path(user), class: 'd-block pull-left btn btn-primary mr-2')
      button.concat(button_to('Reject', user_reject_request_path(user), method: :delete, class: 'pull-right btn btn-danger'))
    else
      button_to 'Add new friend', user_friendships_path(user), class: 'btn btn-info mb-2'
    end
  end
end
