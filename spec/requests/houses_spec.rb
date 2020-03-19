require 'rails_helper'
RSpec.describe 'api request made via houses_controller', type: :request do
  include ApiHelper
  before(:all) do
    @user = create(:user)
    10.times do
      @house = create(:house, user_id: @user.id)
    end
  end

  describe 'Authorization requests' do
    before do
      @token = authenticated_header(@user.id)
    end
    it 'post /houses' do
      post '/houses',
           params: {
             house: {
               name: 'addo',
               category: 'duplex',
               description: 'an awesome house',
               price: '23560500',
               location: 'Ghana',
               pictures: ['/spec/support/assets/test.png']
             },
             headers: { 'Authorization' => @token }
           }
    end
  end

  describe 'No authorization requests' do
    it 'get /houses' do
      get '/houses'
      expect(response).to have_http_status(200)
    end

    it 'get /houses/:id' do
      get "/houses/#{@house.id}"
      expect(response).to have_http_status(200)
    end
  end
end
