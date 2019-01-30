class UsersController < ApplicationController
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
    redirect_to user_path(@user)
  end
  def unsubscribe

  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ご利用ありがとうございました"
    redirect_to root_path
  end
    private
    def user_params
       params.require(:user).permit(:name,:email,:postcode,:address,:phone_number,:kana_name)
    end
end
