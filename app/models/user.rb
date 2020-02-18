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
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  def likes?(post)
    post.likes.where(user_id: id).any?
  end

  def friend_name
    friends.map(&:username)
  end
end
