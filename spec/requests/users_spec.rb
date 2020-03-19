require 'rails_helper'

RSpec.describe 'api request made via users_controller', type: :request do
	
	describe 'post myestateapi/users with complete params' do
    before do
      post '/users',
           params: { user: {
             username: 'addo',
             country: 'Ghana',
             email: 'tester@example.com',
             password: 'iammorethansix',
             picture: '/spec/support/assets/test.png'
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'post myestateapi/users where username is empty' do
    before do
      post '/users',
           params: { user: {
             username: '',
             country: 'Ghana',
             email: 'tester@example.com',
             password: 'iammorethansix',
             picture: '/spec/support/assets/test.png'
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'post myestateapi/users where country is empty' do
    before do
      post '/users',
           params: { user: {
             username: 'Addo',
             country: '',
             email: 'tester@example.com',
             password: 'iammorethansix',
             picture: '/spec/support/assets/test.png'
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'post myestateapi/users where email is empty' do
    before do
      post '/users',
           params: { user: {
             username: 'Addo',
             country: 'Ghana',
             email: '',
             password: 'iammorethansix',
             picture: '/spec/support/assets/test.png'
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'post myestateapi/users where password is empty' do
    before do
      post '/users',
           params: { user: {
             username: 'Addo',
             country: 'Ghana',
             email: 'tester@example.com',
             password: '',
             picture: '/spec/support/assets/test.png'
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'post myestateapi/users where picture is empty' do
    before do
      post '/users',
           params: { user: {
             username: 'Addo',
             country: 'Ghana',
             email: 'tester@example.com',
             password: 'iammorethansix',
             picture: ''
           } }
    end

    it 'successful user creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
