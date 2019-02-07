class UsersCommentsController < ApplicationController
	def create
		cd=Cd.find(params[:cd_id])
		user_comment=current_user.usercomments.new(user_comment_params)
		cd.id=user_comment.cd_id
		user_comment.save
		redirect_to cd_path(cd.id)
	end

	def destroy
		cd=Cd.find(params[:cd_id])
		user_comment=current_user.usercomments.find_by(cd_id: cd_id)
		user_comment.save
		redirect_to cd_path(cd.id)
	end


	private
	def user_comment_params
      params.require(:user_comment).permit(:cd_id, :body,:user_id)
    end
end
