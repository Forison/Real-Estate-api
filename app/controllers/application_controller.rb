class ApplicationController < ActionController::API

  def authorize_request
    header = request.headers['Authorization'] 
    if header
      token = header.split(' ').last 
    end
    begin
      decoded_token = JsonWebToken.decode(token)
      @current_user = User.find(decoded_token[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
