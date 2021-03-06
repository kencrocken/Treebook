class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u| 
      u.permit(:profile_name, :email, :password, :first_name, :last_name)
    end

    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(:email, :password, :password_confirmation, 
               :remember_me, :first_name, :last_name, :profile_name, :full_name)
    end

    devise_parameter_sanitizer.for(:account_update) do |u| 
      u.permit(:email, :password, :password_confirmation, :current_password,
               :remember_me, :first_name, :last_name, :profile_name, :full_name)
    end

  end

end

