require 'rails_helper'
# no defined method current_user.friend?(user)
# error comes from the user_status in the user helpers file 
RSpec.describe 'determine friendship status' do
    scenario 'check for friend requests ' do
        sign_in_user
        expect(page).to have_text("You have 0 Friends")
    end
    
    scenario 'checks add new friend button ' do
        sign_in_user
        visit '/users'
        expect(page).to have_text('Add new friend')
    end
end