class ApplicationController < ActionController::Base
	# def after_sign_in_path_for(resource)
 #  	admin_root_path
	# end
	helper_method :current_carts
  	before_action :configure_permitted_parameters, if: :devise_controller?

  def current_carts
  	@current_carts = curent_user.carts
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kano_name, :email, :postcode, :address, :phone_number, :password,  :password_confirmation])
  end
end
