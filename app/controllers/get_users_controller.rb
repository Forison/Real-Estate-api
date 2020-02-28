class GetUsersController < ApplicationController
  before_action :authorize_request
  def show
    get_user = User.find(params[:id])
    render json: get_user, status: :ok
  end
end
