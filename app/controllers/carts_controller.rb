class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @cart = Cart.find(params[:id])

    @cart.flag=0
    @cart.save
    if @cart.user_id!=current_user.id
      redirect_to user_cart_path(user_id: current_user.id,id:current_user.cart.id) and return

    end
    if @cart.cart_cds.id.group(:cd_id).having('count(id) >= 2') != nil?
    	cd_ids=@cart.cart_cds.group(:cd_id).having('count(*) >= 2').pluck(:cd_id)
    	cd_ids.each do |cd|
    		@cart_cds=@cart.cart_cds.where(cd_id: cd)
    		@cart_cd=@cart.cart_cds.new
    		@cart_cd.cd_id=cd
    		@cart_cd.number=0
    		@cart_cds.each do |f|
    			@cart_cd.number=@cart_cd.number+f.number
    		end
    		@cart_cds.destroy_all
    		@cart_cd.save
    	end
	end
	@sum=0
    @cart.cart_cds.each do |cart_cd|
	      @sum=@sum+cart_cd.cd.price*cart_cd.number
	  end
	 
  end
  
end
column "cart_cds.id" must appear in the GROUP BY clause or be used in an aggregate function