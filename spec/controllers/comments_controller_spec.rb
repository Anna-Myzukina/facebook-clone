require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
     
    describe 'GET comments show' do
        it 'renders 200 ok status code' do
          expect(response.status).to eq(200)
        end
    end
end
