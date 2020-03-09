# frozen_string_literal: true

class CurrentsController < ApplicationController
  before_action :authorize_request
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
    render json: { isLogin: @current_user.houses }, status: :ok
  end
  def categorize
    houses = House.where(category: params[:category])
    render json: houses, status: :ok
  end
  def is_user_login?
    if @current_user
      render json: { isLogin: true }, status: :ok
    else
      render json: { isLogin: false }, status: :unauthorized
    end
  end

  def user_id
    if @current_user
      render json: { userid: @current_user.id }, status: :ok
    else
      render json: { userid: 'unknown' }, status: :unauthorized
    end
  end
end
