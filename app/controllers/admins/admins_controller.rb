class Admins::AdminsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@cds = Cd.where(status: 0)
  end

  def permit
    binding.pry
  	@cd = Cd.find(params[:id])
  	@cd.status = 1
  	@cd.save
    redirect_to admins_admins_path
  end
end
