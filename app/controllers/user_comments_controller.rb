class UserCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	cd = Cd.find(params[:cd_id])
    user_comment = current_user.user_comments.new(user_comment_params)
    user_comment.cd_id = cd.id
    user_comment.save
    redirect_to cd_path(cd)
  end

  private
  def user_comment_params
  params.require(:user_comment).permit(:user_id,:cd_id,:body)
end
end