class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
          :rememberable,  :validatable
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  
  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
