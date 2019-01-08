class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  	artists_artist_path(current_user)
	end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image,:name,:email,:postcode,:address,:image,:phone_number,:introduction])
  end
end

end
