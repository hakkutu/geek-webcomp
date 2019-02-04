class Admins::ArtistsController < ApplicationController
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
    artist.update
    redirect_to admins_artists_path
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admins_artists_path
  end
end
