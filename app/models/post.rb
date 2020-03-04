class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :body, presence: true, length: { minimum: 5, maximum: 500 }
end
