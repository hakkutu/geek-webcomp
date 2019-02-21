class Artists::DiscsController < ApplicationController
	before_action :authenticate_artist!
	def destroy
		disc=disc.find(params[:id])
		disc.destroy
		redirect_to artists_cd_path(disc.cd_id)
	end
	def edit
		disc=disc.find(params[:id])
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
