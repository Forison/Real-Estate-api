class UsersController < ApplicationController
  before_action :authorize_request, only: [:update]
  def create
    new_user = User.new(user_params)
    if new_user.save
      token = JsonWebToken.encode(user_id: new_user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def update
    params[id] = @current_user.id
    notified = User.find(params[:id]).update_column(:noti_level, Houseupdate.pluck('id').max)
    if notified
      head(:ok)
    else
      head(:forbidden)
    end
  end
  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :country,
      :password,
      :picture,
      :noti_level
    )
  end
end
