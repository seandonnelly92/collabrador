class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Added this to call the configure_permitted_parameters method
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :first_name, :last_name, :postcode])
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
