# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'login a user' do
  scenario 'fails to login a user' do
    visit '/login'
    fill_in 'Email', with: ' '
    click_on 'Log in'
    expect(page).to have_content('Remember me')
  end

  scenario 'it logins in a user successfully' do
    visit '/login'
    fill_in 'user[email]', with: 'user.email'
    fill_in 'user[password]', with: 'user.password'
    click_on 'Log in'
    expect(page).to have_content('It`s our footer')
  end
end
