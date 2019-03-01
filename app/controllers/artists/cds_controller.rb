class Artists::CdsController < ApplicationController
		before_action :authenticate_artist!
		def new
			@cd=Cd.new
			@disc=@cd.discs.build
			@song=@disc.songs.build
		end
		def create
			@cd=Cd.new(cd_params)
			@cd.artist_id=current_artist.id
			@cd.status=0

			if @cd.save
			redirect_to artists_artist_path(current_artist)
		else
			render :new
		end
		end
		def show
			@cd=Cd.find(params[:id])
		end
		def edit
			@cd=Cd.find(params[:id])
		end
		def destroy
			@cd=Cd.find(params[:id])
			if @cd.artist_id==current_artist.id
				@cd.destroy
			end
			redrect_to artists_cd_path(cd.id)
		end
		def update
			cd=Cd.find(params[:id])
			cd.update(cd_params)
			redirect_to artists_cd_path(cd.id)
		end
		private
		def cd_params
			params.require(:cd).permit(:artist_id,:genre,:cd_name,:jacket,:price,:label,:stock,:status,:discs_attributes =>[:disc_number,:disc_name,:_destroy,:songs_attributes=> [:id,:disc_id,:song_listen,:song_number,:song_name,:_destroy]])
		end
	end
