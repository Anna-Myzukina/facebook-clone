require 'rails_helper'

RSpec.describe Friendship, type: :feature do
  before :each do
    @first_user = User.create!(username: 'John', sirname: 'Doe',
                               email: 'john08@gmail.com', password: 'johndoe')

    @second_user = User.create!(username: 'Jane', sirname: 'Doe',
                                email: 'jane03@gmail.com', password: 'janedoe')

    visit '/login'
    fill_in 'Email', with: @first_user.email
    fill_in 'Password', with: @first_user.password
    click_button 'Log in'
    visit users_path
    click_button 'Add new friend', match: :first
    click_on 'Logout'
  end

  scenario 'successfully' do
    visit '/login'
    fill_in 'Email', with: @second_user.email
    fill_in 'Password', with: @second_user.password
    click_button('Log in')
    visit user_friendships_path @second_user
    click_on '1 Friend Request'
    expect(page).to have_button('Accept friend request')
    find(:button, 'Accept friend request').click
    visit users_path
    expect(page).to have_button('Unfriend')
  end
end
