module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect 
      self.current_user = verify_user(request.params[:token])
      logger.add_tags 'ActionCable', current_user.id
    end

    private 
    def decode(token)
      JsonWebToken.decode(token)
    end

    def verify_user(token)
      decoded_token  = decode(token)
      auth_user = User.find(decoded_token)
      if !auth_user.nil?
        return auth_user
      else
        return reject_unauthorized_connection
      end
    end
  end

end
