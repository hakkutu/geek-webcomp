class CdsController < ApplicationController
	def index
		@cds=Cd.all
	end
	def show
		@cd=Cd.find(params[:id])
	end
end
