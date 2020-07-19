module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect 
      token = request.headers[:HTTP_SEC_WEBSOCKET_PROTOCOL].split(' ').last
      self.current_user = verify_user(token)
      logger.add_tags 'ActionCable', current_user.id
    end

    private 

    def verify_user(token)
      user_id = JsonWebToken.decode(token)['user_id']
      auth_user = User.find(user_id)
      if auth_user
        return auth_user
      else
        render json: { error: "unauthorized" }, status: :unauthorized
      end
    end
  end
end
