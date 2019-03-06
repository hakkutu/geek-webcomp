class Artists::DiscsController < ApplicationController
	before_action :authenticate_artist!
	def destroy
		disc=Disc.find(params[:id])
		if disc.cd.artist_id==current_artist.id
		disc.destroy
		end
		redirect_to artists_cd_path(disc.cd_id)
	end
	def edit
		@disc=Disc.find(params[:id])
		if @disc.cd.artist_id!=current_artist.id
				artists_cd_path(@disc.cd.id)
			end
	end
	def update
		disc=Disc.find(params[:id])
		disc.update(disc_params)
		redirect_to artists_cd_path(disc.cd_id)
	end
	private
	def disc_params
			params.require(:disc).permit(:cd_id,:disc_number,:disc_name)
	end
end
