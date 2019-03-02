class Admins::CdsController < ApplicationController
before_action :authenticate_admin!
		def edit
			@cd=Cd.find(params[:id])
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
		def update
    	@cd = Cd.find(params[:id])
    	@cd.update(cd_params)
    	redirect_to admins_cd_path(@cd)
		end
		def show
  		@cd = Cd.find(params[:id])
  		@discs = @cd.discs
  		@songs = @cd.songs
  		@comments = (@cd.user_comments.all+@cd.artist_comments.all).sort_by{|comments| comments.created_at}
		end
		def index
  		@cds = Cd.all.search(params[:search])
		end
		private
    private
		def cd_params
			params.require(:cd).permit(:artist_id,:genre,:cd_name,:jacket,:price,:label,:stock,:status,:discs_attributes =>[:disc_number,:disc_name,:_destroy,:songs_attributes=> [:id,:disc_id,:song_listen,:song_number,:song_name,:_destroy]])
		end
end

