
class Artists::ArtistCommentsController < ApplicationController
	def create
		cd=Cd.find(params[:cd_id])
		artist_comment=current_artist.artistcomments.new(artist_comment_params)
		cd.id=artist_comment.cd_id
		artist_comment.save
		redirect_to artists_artist_path(current_artist)
	end
	def destroy
		cd=Cd.find(params[:cd_id])
		artist_comment=current_artist.artistcomments.find_by(cd_id: cd_id)
		artist_comment.save
		redirect_to artists_artist_path(current_artist)
	end


	private
	def artist_comment_params
      params.require(:artist_comment).permit(:cd_id, :body,:atitst_id)
    end
end
