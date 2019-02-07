class CdFavoritesController < ApplicationController
  def create
    binding.pry
    cd=Cd.find(params[:cd_id])
    cd_favorite=CdFavorite.new(cd_id: cd.id)
    cd_favorite.favorite=params[:favorite]
    cd_favorite.user_id=current_user.id
    cd_favorite.save
    redirect_to cd_path(cd.id)
  end

  def destroy
    binding.pry
    cd=Cd.find(params[:cd_id])
    cd_favorite=CdFavorite.find_by(cd_id: cd.id)
    cd_favorite.user_id=current_user.id
    cd_favorite.destroy
    redirect_to cd_path(cd.id)
  end
end

