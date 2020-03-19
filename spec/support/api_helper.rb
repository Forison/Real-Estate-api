module ApiHelper
  def authenticated_header(user)
    JsonWebToken.encode(user_id: user)
  end
end
