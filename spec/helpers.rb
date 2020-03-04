require 'rails_helper'
def sign_up_user
  visit '/registration'
  fill_in 'Username', with: ' jane'
  fill_in 'Sirname', with: 'doe '
  fill_in 'Email', with: 'jdoe@gmail.com '
  fill_in 'Password', with: '123456 '
  click_on 'Sign up'
end

def sign_in_user
  visit '/login'
  fill_in 'Email', with: 'jdoe@gmail.com '
  fill_in 'Password', with: '123456 '
  click_on 'Log in'
end
