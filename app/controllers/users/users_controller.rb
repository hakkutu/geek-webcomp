class Users::UsersController < ApplicationController
	def edit
		@user=User.find(params[:id])
	end

	def show
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
		@user.update(user_params[:id])
		redirect_to user_path(@user.id)
	end
	def user_params
		params.require(:user).permit(:name,:kano_name,:address,:email,:password,:postcode,:phone_number)
	end


end
