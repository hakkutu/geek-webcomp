
class Artists::ArtistCommentsController < ApplicationController
	def create
		artist_comment=ArtistComment.find(params[:id])
	end
	def artist_params
      params.require(:artist).permit(:iamge, :name,:email,:postcode,:address,:phone_number,:imtoduvtion)
    end
end
