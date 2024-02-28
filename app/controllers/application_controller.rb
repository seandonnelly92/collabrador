class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Added this to call the configure_permitted_parameters method
  before_action :create_user_signup_resources, :create_user_login_resources, :devise_mapping

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
  end

  def create_user_signup_resources
    @signup_resource = User.new
    @signup_resource_name = :user
  end

  def create_user_login_resources
    @login_resource = User.new
    @login_resource_name = :user
  end

  def devise_mapping
    @devise_mapping = Devise.mappings[:user] # Used for login
  end
end
