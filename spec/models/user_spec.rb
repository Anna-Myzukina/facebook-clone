require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with  username, sirname,email and password' do
    user = User.new(
      username: 'sponge',
      sirname: 'bob',
      email: 'spongebob@gmail.com',
      password: '123456'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    user = User.new(sirname: nil)
    user.valid?
    expect(user.errors[:sirname]).to include("can't be blank")
  end
  it 'is invalid without an email ' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
