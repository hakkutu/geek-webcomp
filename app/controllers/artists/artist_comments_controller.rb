class Artists::ArtistCommentsController < ApplicationController
	def create
		artist_comment=ArtistComment.find(params[:id])
	end
end
