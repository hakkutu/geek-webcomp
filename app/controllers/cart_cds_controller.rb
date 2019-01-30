class CartCdsController < ApplicationController

  def create
    cd = Cd.find(params[:id])
    carts_cds = CartsCds.new
    cart_id = current_user.cart.id
    cd_id = cd.id
    cats_cds.save
  end

  def destroy
    carts_cds = CartsCD.fint(params[:id])
    carts_cds.destroy
  end
end
