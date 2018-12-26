class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  	admin_root_path
	end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana_name, :email, :postcode, :address, :phone_number, :password,  :password_confirmation])
  end
end
