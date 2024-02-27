class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Added this to call the configure_permitted_parameters method
  before_action :create_signup_resources

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
  end

  def create_signup_resources
    @resource = User.new
    @resource_name = :user
  end
end
