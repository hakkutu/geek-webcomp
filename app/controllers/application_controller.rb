class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
	if artist_signed_in?
		def after_sign_in_path_for(resource)
	  		artists_artist_path(current_artist)
		end

	elsif admin_signed_in?
		def after_sign_in_path_for(resource)
  			admins_admins_path(current_admin)
		end
	elsif user_signed_in?
		def after_sign_in_path_for(resource)
  			cds_index_path(current_user)
		end
 	end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image,:name,:email,:postcode,:address,:image,:phone_number,:introduction])
  end
end
