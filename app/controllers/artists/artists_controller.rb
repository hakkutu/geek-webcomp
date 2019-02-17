class Artists::ArtistsController < ApplicationController
	before_action :authenticate_artist!
	def edit
		@artist=Artist.find(params[:id])
	end
	def update
		@artist=Artist.find(params[:id])
		@artist.update(artist_params)
		redirect_to artists_artist_path
	end

	def show
		@artist=Artist.find(params[:id])
		@artist_comment=ArtistComment.new
		@artist_comments=ArtistComment.all
	end
def artist_params
      params.require(:artist).permit(:iamge, :name,:email,:postcode,:address,:phone_number,:imtoduvtion)
    end
end
