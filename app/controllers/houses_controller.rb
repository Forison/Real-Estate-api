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
      # broadcast to house channel
    else
      head(:unprocessable_entity)
    end
  end

  def show
    house = House.find(params[:id])
    render json: house, status: :ok
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
