class OrderlistCdsController < ApplicationController
  def create
    cart = Cart.find(current_user.cart)
    cart_cds = cart.cart_cds
    cart_cds.each do |cart_cd|
      orderlist_cd = Orderlist_cd.new
      orderlist_cd.cd_id = cart_cd.cd_id
      orderlist_cd.number = cart_cd.number
      orderlist_cd.orderlist_id =
  end
end
