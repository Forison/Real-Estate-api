class CurrentsController < ApplicationController
  before_action :authorize_request, except: [:categorize, :find_a_user]
  def login_user
    if @current_user
      render json: {
        id: @current_user.id,
        username: @current_user.username,
        country: @current_user.country,
        email: @current_user.email,
        picture: @current_user.picture
      }, status: :ok
    else
      head(:unauthorized)
    end
  end

  def user_homes
    render json: { asSeller: @current_user.houses }, status: :ok
  end

  def uploader_homes
    myhouses = House.find(params[:id]).homes
    render json: myhouses, status: :ok
  end

  def categorize
    houses = House.where(category: params[:category])
    render json: houses, status: :ok
  end

  def user_login?
    if @current_user
      render json: { isLogin: true }, status: :ok
    else
      render json: { isLogin: false }, status: :unauthorized
    end
  end

  def check_for_notification
    users_last_notification = @current_user.noti_level
    latest_notification =  Houseupdate.pluck('id').max
    if (users_last_notification == latest_notification)
      render json: {notification: false}, status: :ok
    elsif (users_last_notification < latest_notification)
      render json: {notification: true}, status: :ok
    end
  end

  def user_id
    if @current_user
      render json: { userid: @current_user.id }, status: :ok
    else
      render json: { userid: 'unknown' }, status: :unauthorized
    end
  end
  def find_a_user
    wanted_user = User.where(id: params[:id])
    render json: wanted_user, status: :ok
  end
end
