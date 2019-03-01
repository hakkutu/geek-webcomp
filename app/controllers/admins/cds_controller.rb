
class Admins::CdsController < ApplicationController
before_action :authenticate_admin!
		def edit
			@cd=Cd.find(params[:id])
		end
		def destroy
			@cd=Cd.find(params[:id])
				@cd.destroy
			redrect_to artists_cd_path(cd.id)
		end
end

