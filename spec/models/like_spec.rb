require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is invalid without a user and a post' do
    like = Like.new(user_id: nil, post_id: nil)
    expect(like.save). to eq(false)
  end
end
