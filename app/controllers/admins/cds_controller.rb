class Admins::CdsController < ApplicationController
before_action :authenticate_admin!
			def edit
			
			@cd=Cd.find(params[:id])
			@disc=@cd.discs.build
			@song=@disc.songs.build
		end
		def destroy
			@cd=Cd.find(params[:id])
			@cd.discs.each do |disc|
			 disc.songs.destroy_all
			 disc.destroy
			end
			
			@cd.destroy
			redirect_to admins_cds_path
		end

		def show
  		@cd = Cd.find(params[:id])
  		@discs = @cd.discs
  		@comments = (@cd.user_comments.all+@cd.artist_comments.all).sort_by{|comments| comments.created_at}
		end
		def index
  		@cds = Cd.all.search(params[:search])
		end
		def update
			cd=Cd.find(params[:id])
			cd.update(cd_params)
			redirect_to admins_cd_path(cd.id)
		end
		private
		def cd_params
			params.require(:cd).permit(:id,:artist_id,:genre,:cd_name,:jacket,:price,:label,:stock,:status,:discs_attributes =>[:id,:cd_id,:disc_number,:disc_name,:_destroy,:songs_attributes=> [:id,:disc_id,:song_listen,:song_number,:song_name,:_destroy]])
		end
	end

