class Users::UsersController < ApplicationController
	def edit
		@user=User.find(params[:id])
	end

	def show
		@user=User.find(params[:id])
		@user_favorites = @user.artists
	end
	def update
		@user=User.find(params[:id])
		@user.update(user_params)
		redirect_to users_user_path(@user)
	end
	def user_params
		params.require(:user).permit(:name,:kano_name,:address,:email,:password,:postcode,:phone_number)
	end
	
def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
