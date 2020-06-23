class MyhousesController < ApplicationController
  def favorite
    house = House.find([params[:id]])
    render json: params[id], status: :ok
  end
  def query_params
    params.permit(id: [])
  end
end
