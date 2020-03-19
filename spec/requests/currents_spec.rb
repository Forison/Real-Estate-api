require 'rails_helper'

RSpec.describe 'api request made via currents_controller', type: :request do
	include ApiHelper
	before(:all) do
		@user = create(:user) 
		@house = create(:house, user_id: @user.id)
	end

	describe 'No authorization' do 
		it 'get categorize/category' do
      duplex="duplex"
			get "/category/#{duplex}"
			expect(response).to have_http_status(200) 
		end
		it 'get categorize/category' do
			get "/category/category"
			json = JSON.parse(response.body)
			expect(json).to eql([]) 
		end
	end

	describe 'authorization' do 
		it 'get user_homes route' do
			token = authenticated_header(@user.id)
			get '/user_homes', headers:{"Authorization": token}
			expect(response).to have_http_status(200)
		end

		it 'get login_user route' do
			token = authenticated_header(@user.id)
			get '/login_user', headers:{"Authorization": token}
			expect(response).to have_http_status(200)
		end

		it 'get is_user_login route' do
			token = authenticated_header(@user.id)
			get '/is_user_login', headers:{"Authorization": token}
			expect(response).to have_http_status(200)
		end


		it 'get user_id route' do
			token = authenticated_header(@user.id)
			get '/user_id', headers:{"Authorization": token}
			expect(response).to have_http_status(200)
		end
		
		it 'get uploader_homes/:id route' do
			token = authenticated_header(@user.id)
			get "/uploader_homes/#{@user.id}", headers:{"Authorization": token}
			expect(response).to have_http_status(200)
		end

	end
end
