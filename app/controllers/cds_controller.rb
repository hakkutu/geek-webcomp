<<<<<<< HEAD
=======
class CdsController < ApplicationController
  def index
  	@cds = Cd.all
  end

  def show
  	@cd = Cd.find(params[:id])
  	@discs = @cd.discs
  	@songs = @cd.songs
  	@user_comment = User_comment.new
  	@user_comments = User_comment.all

  end
end
>>>>>>> master
