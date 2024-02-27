class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Added this to call the configure_permitted_parameters method

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
  end
end
