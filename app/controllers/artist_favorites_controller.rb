class ArtistFavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @artist=Artist.find(params[:every_artist_id])
     if @artist.favorited_by?(current_user)
      favorite=current_user.artist_favorites.find_by(artist_id: @artist.id)
      favorite.destroy
      render json: @artist.id
    else
      favorite=ArtistFavorite.new(artist_id: @artist.id)
      favorite.user_id=current_user.id
      favorite.save
      render json: @artist.id
    end
  end
end
