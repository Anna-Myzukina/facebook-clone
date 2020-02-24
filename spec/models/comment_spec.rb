require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is invalid without a username ' do
    @comment = Comment.new(content: 'great', user_id: 2, post_id: 2, user: nil)
    expect(@comment.save).to eq(false)
  end
  it ' is invalid without a comment body' do
    @comment = Comment.new(content: nil)
    expect(@comment.save).to eq(false)
  end
end
