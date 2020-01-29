class Post < ApplicationRecord
    belongs_to :user
    has_many :coment
end
