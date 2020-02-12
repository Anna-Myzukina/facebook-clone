require 'rails_helper'

RSpec.describe 'signup a user' do
  scenario 'fails to signup user ' do
    visit '/registration'
    fill_in 'Username', with: ' '
    fill_in 'Sirname', with: ' '
    fill_in 'Email', with: ' '
    fill_in 'Password', with: ' '
    click_on 'Sign up'
    expect(page).to have_content("4 errors prohibited this user from being saved")
  end

  scenario 'successfully signup a user ' do
    visit '/registration'
    fill_in 'Username', with: ' jane'
    fill_in 'Sirname', with: 'doe '
    fill_in 'Email', with: 'jdoe@gmail.com '
    fill_in 'Password', with: '123456 '
    click_on 'Sign up'
    expect(page).to have_content("facebook-clone")
  end
  
end
