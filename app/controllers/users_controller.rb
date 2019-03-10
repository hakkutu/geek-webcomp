class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
  	@user = User.find(params[:id])
    if @user.id!=current_user.id
      redirect_to user_path(@user)
    end
  end

  def show
  	@user = User.find(params[:id])
  	if @user.id!=current_user.id
  	  redirect_to root_path
  	else
      @user_artists = @user.artists
      @user_orderlists = @user.orderlists
    end
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
    flash[:info] = "ご利用ありがとうございました"
    redirect_to root_path
  end
  private
    def user_params
       params.require(:user).permit(:name,:email,:postcode,:address,:phone_number,:kana_name)
    end
end
