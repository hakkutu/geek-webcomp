
	class Artists::CdsController < ApplicationController
		def new
			@cd=Cd.new
			@disc=@cd.discs.build
			@song=@disc.songs.build
		end
		def create
			cd=Cd.new(cd_params)
			cd.status=0
			cd.artist_id = current_artist.id
			cd.save
			redirect_to artists_artist_path(current_artist)
		end
		def show

		end
		def edit

		end
		def destroy

		end
		def update

		end
		private
		def cd_params
			params.require(:cd).permit(:artist_id,:genre,:jacket,:price,:label,:stock, discs_attributes: [:id,:cd_id,:disc_name],discs_attributes:[:disc_number,:disc_name,:_destroy,songs_attributes: [:id,:disc_id,:song_listen,:song_number,:song_name,:_destroy]])
		end
	end
