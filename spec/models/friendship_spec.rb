require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'is invalid without a user and a friend' do
    @friendship = Friendship.new
    expect(@friendship.save).to eq(false)
  end

  it 'is invalid for a user without a friend' do
    @friendship = Friendship.new(user_id: 1)
    expect(@friendship.save).to eq(false)
  end
end 
