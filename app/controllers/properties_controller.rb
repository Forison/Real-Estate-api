class PropertiesController < ApplicationController
  before_action :authorize_request
  def index
    properties = Property.all 
    render json: properties, status: :ok
  end
  def create
	property = @current_user.properties.build(prop_params)
	if property.save
	  render json: property, status: :created
	else
	  head(:unprocessable_entity)
	end
 end
 def destroy
	property = Property.find(params[:id])
	if property.save
	  head(:ok)
	else
	  head(:unprocessable_entity)
	  end
  end
	private
	def prop_params
		params.require(:properties).permit(:user_id, :name,:category,:price,:location, :description);
	end
end
