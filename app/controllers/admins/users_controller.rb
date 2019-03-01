class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def index
		@users = User.all
	end
  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  	@user_artists = @user.artists
  	@user_orderlists = @user.orderlists
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end
    private
    def user_params
       params.require(:user).permit(:name,:email,:postcode,:address,:phone_number,:kano_name)
    end

end
