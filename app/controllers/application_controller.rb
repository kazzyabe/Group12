class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :remember_me)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:username, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :gender, :realname, :biography, :age, :interestedin, :current_password)
    end
  end
end
