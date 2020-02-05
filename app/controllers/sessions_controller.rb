class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user&.authenticate(params[:password])
			token = JsonWebToken.encode(user_id: user.id)
			time = Time.now + 24.hours.to_i
			render json: {token: token, time: time, user_id: user.id}, status: :ok
		else
			render json: params[:email], status: :unauthorized
		end
  end
	def destroy 
	end
end
