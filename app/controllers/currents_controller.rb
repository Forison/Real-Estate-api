class CurrentsController < ApplicationController
  before_action :authorize_request
  def login_user
		if @current_user
		render json: {user: @current_user}, status: :ok
		else
		head(:unauthorized)
		end
	end
end
