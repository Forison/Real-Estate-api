class FavoritesController < ApplicationController
  before_action :authorize_request

  def create
    favorites = @current_user.favorites.build(fav_params)
    if favorites.save
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end
  
  def show
    render json: @current_user.favorites.ids, status: :ok
  end

  private

  def fav_params
    params.require(:favorite).permit(:house_id)
  end
end
