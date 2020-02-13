require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is invalid without a username ' do
    @comment = Comment.new(body: 'great', user_id: 2, post_id: 2, username: nil)
    expect(@comment.save).to eq(false)
  end
  it ' is invalid without a comment body' do
    @comment = Comment.new(body: nil)
    expect(@comment.save).to eq(false)
  end
end
