require 'rails_helper'

RSpec.feature 'add a new friend' do
    scenario 'sends a new friend request ' do
        visit '/users'
        click_on 'Add new friend'
        expect(page).to have_text('Cancel request')
    end

    scenario 'accept new friend' do
        visit '/users'
        click_on 'Accept friend request'
        expect(page).to have_text('Unfriend')
    end
end