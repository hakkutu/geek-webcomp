class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart.find(params[:id])
    if @cart.user!=current_user
     redirect_to root_path
    end
    @sum=0
    @cart = current_user.cart
    @cart.cart_cds.each do |cart_cd|
	      @sum=@sum+cart_cd.cd.price*cart_cd.number
	  end
    
    if @cart.cart_cds.group(:cd_id).having('count(*) >= 2')!=nil?
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
	  
  end
end
