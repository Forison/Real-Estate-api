class FavoritesController < ApplicationController
  before_action :authorize_request
  
  def index
    render json: @current_user.favorites, status: :ok
  end

  def create
    favorites = @current_user.favorites.build(fav_params)
    if favorites.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    find_row = @current_user.favorites.where(house_id: params[:id]).ids
    Favorite.find(find_row[0]).destroy
    head(:ok)
  end
  private

  def fav_params
    params.require(:favorite).permit(:house_id)
  end
end
