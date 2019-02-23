class Admins::ArtistsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to admins_artist_path(artist.id)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admins_artists_path
  end
  private
    def artist_params
      params.require(:artist).permit(:iamge, :name,:email,:postcode,:address,:phone_number,:imntroduction)
    end
end
