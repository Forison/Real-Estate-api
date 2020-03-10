# frozen_string_literal: true

class SellersController < ApplicationController
  before_action :authorize_request
  def index
    sel = House.pluck('user_id')
    seller = User.find(sel)
    render json: seller, status: :ok
  end

  def show
    uploader = User.find(params[:id])
    render json: uploader, status: :ok
  end
end
