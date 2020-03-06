# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authorize_request
  def index
    favorites = Favorite.pluck('myfavorite')
    fav_house = House.find(favorites)
    render json: fav_house, status: :ok
  end

  def create
    favorites = @current_user.favorites.build(fav_params)
    if favorites.save
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def fav_params
    params.require(:user).permit(:user_id, :myfavorite)
  end
end