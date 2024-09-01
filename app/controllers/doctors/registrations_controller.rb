# app/controllers/doctors/registrations_controller.rb
class Doctors::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  # Permit additional parameters like :name during sign up
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end

  # Permit additional parameters like :name during account update
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
  end

  # Override to use custom path after sign up
  def after_sign_up_path_for(resource)
    doctor_path(resource) # Redirect to the doctor's profile or dashboard
  end

  # Override to use custom path after account update
  def after_update_path_for(resource)
    doctor_path(resource) # Redirect to the doctor's profile after updating account
  end
end
