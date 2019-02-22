class Admins::CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def show
    @cd = Cd.find(params[:id])
  end

  def edit
    @cd = Cd.find(params[:id])
  end

  def update
    cd = Cd.find(params[:id])
    cd.update
    redirect_to admins_cd_path(cd)
  end

  def destroy
    cd = Cd.find(params[:id])
    cd.destroy
    redirect_to admins_cds_path
  end


before_action :authenticate_admin!

end
