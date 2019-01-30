class OrderlistsController < ApplicationController
  def index
    @orderlists = Orderlist.all
  end

  def create
    orderlist = Orderlist.new
    cart = Cart.find(current_user.cart)
    cart_cds = cart.cart_cds
    orderlist.user_id = current_user.id
    orderlist.address = current_user.address
    orderlist.address_number = current_user.address_number
    orderlist.address = current_user.address
    #発送のステータスは0=未発送,1=発送済み
    orderlist.status = 0
    orderlist.save
    cart_cds.each do |cart_cd|
      orderlist_cd = Orderlist_cd.new
      orderlist_cd.cd_id = cart_cd.cd_id
      orderlist_cd.number = cart_cd.number
      orderlist_cd.orderlist_id = orderlist.id
      orderlist_cd.save
    end
  end
end
