class Admins::UserCommentsController < ApplicationController
before_action :authenticate_admin!
def destroy
	@comment=UserComment.find(params[:id])
	@comment.destroy
	redirect_to cd_path(@comment.id)
end
end
