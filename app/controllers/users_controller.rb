class UsersController < ApplicationController
	def create
	  new_user = User.new(user_params)
	  if new_user.save
	    render json: new_user, status: :ok
	  else
		head(:unprocessable_entity)
	  end
    end
	def destroy
		old_user = User.find(params[:id])
		if old_user.save
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :country, :password)
	end
end
