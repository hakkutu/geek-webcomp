class OrderlistsController < ApplicationController
  before_action :authenticate_user!
 def new
    @orderlist=Orderlist.new
  end

  def create
    orderlist = Orderlist.new(orderlist_params)
    cart = Cart.find(current_user.cart.id)
    cart_cds = cart.cart_cds
    orderlist.user_id = current_user.id
    #orderlist.address = current_user.address
    #orderlist.address_number = current_user.adress_number
    #発送のステータスは0=未発送,1=発送済み
    orderlist.status = 0
    orderlist.save
    a=0
    cart_cds.each do |cart_cd|
      orderlist_cd = OrderlistCd.new
      orderlist_cd.cd_id = cart_cd.cd_id
      orderlist_cd.number = cart_cd.number
      orderlist_cd.price=a+cart_cd.number*cart_cd.cd.price
      orderlist_cd.orderlist_id = orderlist.id
      cd=cart_cd.cd
      cd.stock-=cart_cd.number
      cd.save
      orderlist_cd.save
    end
    cart_cds.destroy_all
    redirect_to root_path
  end

  private
  def orderlist_params
  params.require(:orderlist).permit(:address,:address_number)
    end
end
