class UsersController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  	@user_artists = User.artists
  	@user_orderlists = User.orderlists

  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
  end
    private
    def user_params
       params.require(:user).permit(:name,:email,:postcode,:address,:phone_number,:kana_name)
    end
end
