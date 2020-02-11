class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  validates  :username, presence: true
  validates  :sirname, presence: true
  validates  :email, presence: true
  validates  :password, presence: true
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
  
  def friends 
    friends_array = friendships.map {|friendship| friendship.friend if friendship.confirmed}
    friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
    friends_array.compact
  end

  def friend?(user)
      friends.include?(user)
  end
  
  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendship.user == user}
    friendship.confirmed = true
    friendship.save
  end 

  def friend_requests
    inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
  end
  
  def pending_friends
    friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  end
end