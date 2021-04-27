class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :phone, :exp, :speciality,
                                            :description])
    end

    def previous_url
        # session[:previous_url] is a Rails built-in variable to save last url.
        session[:my_previous_url] = URI(request.referer || '').path
      end
end
