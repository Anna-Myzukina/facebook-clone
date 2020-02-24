class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates :username, presence: true
  validates :sirname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy

  def likes?(post)
    post.likes.where(user_id: id).any?
  end

  def friends
    friends = friendships.includes(:friend).where(confirmed: true).references(:users)
    friends.map(&:friend)
  end

  def pending_friendship
    requests = friendships.includes(:friend).where(confirmed: false).references(:users)
    requests.map(&:friend)
  end

  def friendship_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def send_request(friend)
    return if Friendship.exists?(user_id: id, friend_id: friend.id) ||
              Friendship.exists?(user_id: friend.id, friend_id: id)

    Friendship.create(user_id: id, friend_id: friend.id)
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |friend| friend.user == user }
    friendship.confirmed = true
    friendship.save

    friendships.create(friend_id: user.id, confirmed: true)
  end

  def friend?(user)
    friends.include?(user)
  end
end
