class Admins::UserCommentsController < ApplicationController
before_action :authenticate_admin!
def destroy
	@cd=Cd.find(params[:cd_id])
	@comment=@cd.usercomments.find(params[:id])
	@comment.destroy
	redirect_to cd_path(@comment.id)
end
end
