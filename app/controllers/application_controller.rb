class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		case resource
		when User
			root_path
		when Artist
     	artists_artist_path(current_artist)
  		when Admin
    	 admins_admins_path
    end
  end

  protected

  def configure_permitted_parameters
    if Artist
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    elsif User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :kana_name, :address, :postcode, :phone_number])
    end
  end

end
    