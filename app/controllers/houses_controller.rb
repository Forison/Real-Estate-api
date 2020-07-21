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
      ActionCable.server.broadcast('houses_channel', houses )
      house_notification(houses.id)
    else
      head(:unprocessable_entity)
    end
  end

  def show
    house = House.find(params[:id])
    render json: house, status: :ok
  end

  private
  
  def house_notification(house_id)
    houses = House.find_by_id(house_id)
    return unless houses.present?
    Houseupdate.create!(poster: houses.user_id, item: house_id, reader: '', read_at: '')
  end

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
