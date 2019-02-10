class Admins::AdminsController < ApplicationController
  def index
  	@cds = Cd.where(status: 0)
  end

  def permit
  	@cd = Cd.find(params[:cd_id])
  	@cd.status = 1
  	@cd.save

  end
end
