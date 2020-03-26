require 'rails_helper'
RSpec.describe 'api request made via alert_controller', type: :request do
  include ApiHelper

  describe 'post myestateapi/alerts with complete params' do
    before do
      post '/alerts',
           params: { alert: {
             sender: 'tester@example.com',
             message: ' hello I am happpy to see you'
           } }
    end

    it 'successful message creation' do
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'post myestateapi/alerts with complete params' do
    before do
      post '/alerts',
           params: { alert: {
             sender: '',
             message: ' hello I am happpy to see you'
           } }
    end

    it 'unsuccessful message creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'post myestateapi/alerts with complete params' do
    before do
      post '/alerts',
           params: { alert: {
             sender: 'test@yahoo.com',
             message: ''
           } }
    end

    it 'unsuccessful message creation' do
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
