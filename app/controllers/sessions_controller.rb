class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: :ok
    else
      render json:
       { error: 'username or password not found' },
             status: :unauthorized
    end
  end

  def destroy; end
end
