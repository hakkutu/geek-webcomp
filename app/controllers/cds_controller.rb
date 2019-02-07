class CdsController < ApplicationController
  def index
  	@cds = Cd.all
  end

  def show
  	@cd = Cd.find(params[:id])
  	@discs = @cd.discs
  	@songs = @cd.songs
  	@user_comment = UserComment.new
  	@user_comments = UserComment.all

  end
end
