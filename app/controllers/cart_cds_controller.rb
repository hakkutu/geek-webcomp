class CartCdsController < ApplicationController
before_action :authenticate_user!
  def create
    @cd=Cd.find(params[:cd_id])
    @cart_cds2=CartCd.new(cart_cd_params)
    @cart_cds2.cart_id=current_user.cart.id
    @cart_cds2.cd_id=@cd.id
    if @cart_cds2.save
    redirect_to user_cart_path(current_user,current_user.cart.id)
    else

  	@discs = @cd.discs
    @cart_cds=CartCd.new
  	@user_comment = UserComment.new
  	@comments = (@cd.user_comments.all+@cd.artist_comments.all).sort_by{|comments| comments.created_at}
      render "carts/show"

    end
  end

  def destroy
    cart_cd=CartCd.find(params[:id])
    cart_cd.destroy
    redirect_to user_cart_path(current_user,current_user.cart.id)
  end
  def edit
    @cart_cd=CartCd.find(params[:id])
    if @cart_cd.cart_id!=current_user.cart.id
     redirect_to user_cart_path(user_id: current_user.id,id: @cart_cd.cart.id)
  end 
  def update
    @cart_cd = CartCd.find(params[:id])
    @cart_cd.update(cart_cd_params)
    redirect_to user_cart_path(user_id:current_user.id,id:@cart_cd.cart.id)
  end
  end
  private
  def cart_cd_params
    params.require(:cart_cd).permit(:cd_id, :number,:cart_id)
  end
end
