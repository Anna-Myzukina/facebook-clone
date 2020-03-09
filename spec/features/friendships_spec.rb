require 'rails_helper'

RSpec.describe Friendship, type: :feature do
  before :each do
    @first_user = User.create!(username: 'John', sirname: 'Doe',
                               email: 'john08@gmail.com', password: 'johndoe')

    @second_user = User.create!(username: 'Jane', sirname: 'Doe',
                                email: 'jane03@gmail.com', password: 'janedoe')
  end
  scenario 'successfully send friend request' do
    visit '/login'
    fill_in 'Email', with: @first_user.email
    fill_in 'Password', with: @first_user.password
    click_button 'Log in'
    visit users_path
    click_button 'Add new friend', match: :first
    click_on 'Logout'
    visit '/login'
    fill_in 'Email', with: @second_user.email
    fill_in 'Password', with: @second_user.password
    click_button 'Log in'
    visit users_path
    # visit user_friendships_path @second_user
    # expect(page).to have_button('Accept friend request')
    # click_button 'Accept friend request', :match => :first
    # find_button('Accept friend request', disabled: true)
    expect(page).to have_text('You have 0 Friends')
  end
end
