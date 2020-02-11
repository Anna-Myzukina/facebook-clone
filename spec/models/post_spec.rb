require 'rails_helper'

RSpec.describe Post, type: :model do
    it 'is not valid without a post ' do
        @post = Post.new(post_id:1,user_id: 1, body: nil)
        expect(@post.save).to eq(false)
    end

    it 'is not valid without a user' do
        @post = Post.new(post_id:1,user_id: nil, body:" a new day")
        expect(@post.save).to eq(false)
    end
  
end
