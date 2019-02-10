class CartCdsController < ApplicationController

  def create
    cd=Cd.find(params[:cd_id])
    cart_cds=CartCd.new
    cart_cds.cart_id=current_user.cart.id
    cart_cds.cd_id=cd.id
    cart_cds.save
    redirect_to user_cart_path(current_user,current_user.cart.id)
  end

  def destroy
    cart_cds=CartCd.find(params[:id])
    cart_cds.destroy
    redirect_to user_cart_path(current_user,current_user.cart.id)
  end
end
