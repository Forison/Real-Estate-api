class HouseupdatesController < ApplicationController
  before_action :authorize_request
  def index
    house_ids = Houseupdate.where(reader: [nil, !@current_user.id]).pluck('item')
    house_listings = []
    house_ids.each do | i |
      house_listings << House.find(i)
    end
    render json: house_listings, status: :ok
  end
  
end
