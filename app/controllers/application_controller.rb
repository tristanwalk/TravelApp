class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery with: :exception
	#protect_from_forgery with: :null_session
  	before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
  home_index_path
end
  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :firstName, :lastName, :empID, :deptNum])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:empID, :password, :remember_me])
      end
end