class Artists::SongsController < ApplicationController
	before_action :authenticate_artist!
	def destroy
		song=Song.find(params[:id])
		song.destroy
		redirect_to artists_cd_path(song.disc.cd_id)
	end
	def edit
		@song=Song.find(params[:id])
		if @song.disc.cd.artist_id!=current_artist.id
				artists_cd_path(@disc.cd.id)
		end
	end
	def update
		song=Song.find(params[:id])
		song.update(song_params)
		redirect_to artists_cd_path(song.disc.cd_id)
	end
	private
	def song_params
			params.require(:song).permit(:disc_id,:song_number,:song_name)
	end
end
