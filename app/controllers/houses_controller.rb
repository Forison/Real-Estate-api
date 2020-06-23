class HousesController < ApplicationController
  before_action :authorize_request, only: [:create]
  def index
    all_houses = House.all
    render json: all_houses, status: :ok
  end

  def create
    houses = @current_user.houses.build(prop_params)
    if houses.save
      render json: houses, status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def show
    house = House.find(params[:id])
    render json: house, status: :ok
  end

  def favorite
    my_fav_house = []
    [params[:id]].each do |n| 
      my_fav_house << House.find(n)
    end
    render json: my_fav_house, status: :ok
  end

  private

  def prop_params
    params.require(:house).permit(
      :user_id,
      :name,
      :category,
      :price,
      :location,
      :description,
      pictures: []
    )
  end
end
