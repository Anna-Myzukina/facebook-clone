require 'rails_helper'

RSpec.describe User, type: :model do
    it 'is valid with  username, sirname,email and password' do
        user = User.new(
            Username:"sponge",
            Sirname: "bob",
            Email: "spongebob@gmail.com",
            password: "123456",
        )
        expect(user).to be_valid
    end
    it 'is invalid without a first name'
    it 'is invalid without a last name'
    it 'is invalid without an email '
end
