class ArtistFavoritesController < ApplicationController
  def create
    artist=Artist.find(params[:every_artist_id])
    favorite=ArtistFavorite.new(artist_id: artist.id)
    favorite.user_id=current_user.id
    favorite.save
    redirect_to every_artist_path(artist.id)
  end

  def destroy
    artist=Artist.find(params[:every_artist_id])
    favorite=current_user.artist_favorites.find_by(artist_id: artist.id)
    favorite.destroy
    redirect_to every_artist_path(artist.id)
  end
end
