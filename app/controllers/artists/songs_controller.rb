class Artists::SongsController < ApplicationController
	before_action :authenticate_artist!
	def destroy
		song=song.find(params[:id])
		song.destroy
		redirect_to artists_cd_path(song.disc_id.cd_id)
	end
	def edit
		song=song.find(params[:id])
	end
	def update
		song=Song.find(params[:id])
		song.update(song_params)
		redirect_to artists_cd_path(song.disc_id.cd_id)
	end
	private
	def disc_params
			params.require(:disc).permit(:disc_id,:disc_number,:disc_name)
	end
end
