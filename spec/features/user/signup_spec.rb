# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'signup a user' do
  scenario 'fails to signup user ' do
    visit '/signup'
    fill_in 'Email', with: ' '
    click_on 'Sign up'
    expect(page).to have_content('2 errors prohibited this user from being saved')
  end

  scenario 'signining up a user' do
    visit '/signup'
    fill_in 'user[name]', with: 'user.name'
    fill_in 'user[sirname]', with: 'user.sirname'
    fill_in 'user[email]', with: 'user.email'
    fill_in 'user[password]', with: 'user.password'
    fill_in 'user[password_confirmation]', with: 'user.password_confirmation'
    click_on 'Sign up'
    expect(page).to have_content('It`s our footer')
  end
end
