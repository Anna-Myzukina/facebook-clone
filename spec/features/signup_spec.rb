require 'rails_helper'

RSpec.describe 'signup a user' do
  scenario 'fails to signup user ' do
    visit '/registration'
    fill_in 'Username', with: ' '
    fill_in 'Sirname', with: ' '
    fill_in 'Email', with: ' '
    fill_in 'Password', with: ' '
    click_on 'Sign up'
    expect(page).to have_content('2 errors prohibited this user from being saved')
  end

  scenario 'signining up a user' do
    visit '/registration'
    fill_in 'user[username]', with: 'user.username'
    fill_in 'user[sirname]', with: 'user.sirname'
    fill_in 'user[email]', with: 'user.email'
    fill_in 'user[password]', with: 'user.password'
    click_on 'Sign up'
    expect(page).to have_content('Create a Page for a celebrity, band or busyness')
  end
end
