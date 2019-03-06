class CdsController < ApplicationController
  def index
  	@cds = Cd.all.search(params[:search])
  end
  

  def show
  	@cd = Cd.find(params[:id])
  	@discs = @cd.discs
    @cart_cds=CartCd.new
  	@user_comment = UserComment.new
  	@comments = (@cd.user_comments.all+@cd.artist_comments.all).sort_by{|comments| comments.created_at}
  end
end
