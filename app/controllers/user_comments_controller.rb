class UserCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@cd = Cd.find(params[:cd_id])
  	@discs = @cd.discs
    @cart_cds=CartCd.new
  	@user_comment = UserComment.new
  	@comments = (@cd.user_comments.all+@cd.artist_comments.all).sort_by{|comments| comments.created_at}
    @user_comment2 = current_user.user_comments.new(user_comment_params)
    @user_comment2.cd_id = @cd.id
    if @user_comment2.save
      redirect_to cd_path(@cd)
    else
      render "cds/show"
    end
  end
def destroy
		cd=Cd.find(params[:cd_id])
		user_comment=current_user.user_comments.find_by(cd_id: cd.id)
		user_comment.destroy
		redirect_to cd_path(cd.id)
	end
  private
  def user_comment_params
  params.require(:user_comment).permit(:user_id,:cd_id,:body)
  end
end