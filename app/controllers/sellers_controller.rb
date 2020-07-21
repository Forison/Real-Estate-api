class SellersController < ApplicationController
  def index
    sellers_id = House.pluck('user_id').uniq
    user = []
    sellers_id.each do | a |
      user << User.find(a)
    end
    render json: user, status: :ok
  end

  def show
    uploader = User.find(params[:id])
    render json: uploader, status: :ok
  end
end
