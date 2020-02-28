class SellersController < ApplicationController
  before_action :authorize_request
  def show
    uploader = User.find(params[:id])
    render json: uploader, status: :ok
  end
end
