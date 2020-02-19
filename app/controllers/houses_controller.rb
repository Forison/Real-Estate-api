# frozen_string_literal: true

class HousesController < ApplicationController
  before_action :authorize_request
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

  def destroy
    house = House.find(params[:id])
    if houses.save
      head(:ok)
    else
      head(:unprocessable_entity)
      end
   end

  private

  def prop_params
    params.require(:houses).permit(:user_id, :name, :category, :price, :location, :description, :images[])
    end
end
