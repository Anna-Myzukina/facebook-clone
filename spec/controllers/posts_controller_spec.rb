require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    describe "GET index" do
        it " has 200 ok status code " do
            expect(response.status).to eq(200)
        end
    end

    describe 'responds to' do
        it 'responds to html rendering format' do
            post :create, :params=> { :post => {:body => "this is my first post"}}
            expect(response.content_type).to eq "text/html"
        end
    end
end
