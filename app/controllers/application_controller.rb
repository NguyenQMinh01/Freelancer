class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    #protect_from_forgery with: :null_session
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
    end

    def after_sign_in_path_for(resource)
      dashboard_path
    end
end
