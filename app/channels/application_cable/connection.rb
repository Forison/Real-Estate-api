module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    def connect 
      self.current_user = verify_user(request.params[:token])
      logger.add_tags 'ActionCable', current_user.id
    end

    private 
    def decode(token)
      decoded = JWT.decode(token, SECRET_KEY)
      HashWithIndifferentAccess.new decoded
    end

    def verify_user(token)
      decode_token  = decode(token)
      auth_user = User.find(decode_token)
      if !auth_user.nil?
        return auth_user
      else
        return reject_unauthorized_connection
      end
    end
  end

end
