class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if  current_artist
			artists_artist_path(current_artist)
		elsif current_user
			user_path(current_user)
		elsif current_admin
			admins_admins_path
		end
	end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end



