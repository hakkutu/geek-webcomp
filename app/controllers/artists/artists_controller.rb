class Artists::ArtistsController < ApplicationController
	before_action :authenticate_artist!
	def edit
		@artist=Artist.find(params[:id])
		 if @artist.id!=current_artist.id
      		redirect_to artists_artist_path(@artist)
		end
	end
	def update
		@artist=Artist.find(params[:id])
		@artist.update(artist_params)
		redirect_to artists_artist_path
	end
	
		def destroy
			@artist=Artist.find(params[:id])
			if @artist.id==current_artist.id
				@artist.destroy
				
			end
			redirect_to root_path
		end
	def show
		@artist=Artist.find(params[:id])
		@artist_comment=ArtistComment.new
		@artist_comments=ArtistComment.all
		if @artist.id!=current_artist.id
		redirect_to root_path
		end
	end
	private
	def artist_params
      params.require(:artist).permit(:iamge, :name,:email,:postcode,:address,:phone_number,:inteoduction)
    end
end
