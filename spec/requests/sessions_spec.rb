require 'rails_helper'

RSpec.describe 'api request made via sessions_controller', type: :request do
  before (:all) do
    user = create(:user, email: 'tester@example.com')
  end
  describe 'login a user' do
    it 'if sign up is successful' do
      post '/sessions', params: {
        email: 'tester@example.com',
        password: 'iammorethansix'
      }
      expect(response).to have_http_status(200)
    end
  end
  describe 'login a user' do
    it 'if sign up is unsuccessful' do
      post '/sessions', params: {
        email: 'nonexitentuser@example.com',
        password: 'unknownpassword'
      }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
