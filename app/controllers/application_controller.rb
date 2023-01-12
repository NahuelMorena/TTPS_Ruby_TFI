class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.json { head :forbidden }
            format.html { redirect_to root_path, alert: "No cuenta con los permisos necesarios para realizar esta acción" }
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
    end
end
