class V1::PropertiesController < ApplicationController
  def index
    @properties =Property.all 
    render json: @properties, status: :ok
	end
	def create
		property = Property.create(prop_params)
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
		params.require(:properties).permit(:name,:category,:price,:size);
	end
end
