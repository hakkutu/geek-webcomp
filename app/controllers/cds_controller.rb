class CdsController < ApplicationController
  def index
  end

  def show
  	@user_comment = User_comment.new
  	@artist_comment = Artist_commnet.new
  end
end
