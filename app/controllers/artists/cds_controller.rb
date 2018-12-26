class Artists::CdsController < ApplicationController
	def new
		@cd=Cd.new
		@disc=@cd.discs.build
		@song=@disc.songs.build
	end
	def create

	end
	def show

	end
	def edit

	end
	def destroy

	end
	def update

	end
	def book_params
      params.require(:artist).permit(:artist_id,:genre,:jacket,:price,:label,:stock,:status,discs_attributes: [:id,:cd_id,:disc_name],discs_attributes:[:disc_number,:disc_name],songs_attributes: [:id,:disc_id,:song_listen,:song_number,:song_name])
    end
end
