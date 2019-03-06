class CartCdsController < ApplicationController
before_action :authenticate_user!
  def create
    @cd=Cd.find(params[:cd_id])
    cart_cds=CartCd.new(cart_cd_params)
    cart_cds.cart_id=current_user.cart.id
    cart_cds.cd_id=@cd.id
    if cart_cds.save
    redirect_to user_cart_path(current_user,current_user.cart.id)
    else
      render "carts/show"
  end

  def destroy
    cart_cd=CartCd.find(params[:id])
    cart_cd.destroy
    redirect_to user_cart_path(current_user,current_user.cart.id)
  end
  private
  def cart_cd_params
      params.require(:cart_cd).permit(:cd_id, :number,:cart_id)
    end
end
