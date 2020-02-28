require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "GET index" do
        it "renders 200 ok status code" do
            expect(response.status).to eq(200)
        end
    end
end
