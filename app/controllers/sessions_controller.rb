class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if User.exists?(email: params[:email])
			# sign in  user
			render json: user, status: :ok
		else
			render json: params[:email], status: :unauthorized
		end
  end
	def destroy 
	end

end
