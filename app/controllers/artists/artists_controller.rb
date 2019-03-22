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
	def permit
		@orderlist=Orderlist.find(params[:id])
		if @orderlist.status==0
  			@orderlist.status=1
  		elsif @orderlist.status==1
  			@orderlist.status=2
  		elsif @orderlist.status==2
  			@orderlist.status=3
  		end
  		@orderlist.save
  		redirect_to artists_artist_path(current_artist.id)
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
		@orderlist_cds=OrderlistCd.all
		if @artist.id!=current_artist.id
		redirect_to root_path
		end
	end
	private
	def artist_params
      params.require(:artist).permit(:iamge, :name,:email,:postcode,:address,:phone_number,:inteoduction)
    end
end
