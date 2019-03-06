
class Artists::ArtistCommentsController < ApplicationController
	before_action :authenticate_artist!
	def create
		@cd=Cd.find(params[:cd_id])
		@artist_comment2=current_artist.artist_comments.new(artist_comment_params)
		@artist_comment2.cd_id=@cd.id
		if @artist_comment2.save
		redirect_to artists_artist_path(current_artist)
		else
			@artist=@cd.artist
			@artist_comment=ArtistComment.new
			@artist_comments=ArtistComment.all
			render "artists/artists/show"
		end
	end
	def destroy
		cd=Cd.find(params[:cd_id])
		artist_comment=current_artist.artist_comments.find_by(cd_id: cd.id)
		artist_comment.destroy
		redirect_to artists_artist_path(current_artist)
	end


	private
	def artist_comment_params
      params.require(:artist_comment).permit(:cd_id, :body,:atitst_id)
    end
end
