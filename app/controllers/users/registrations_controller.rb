# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  def new
    build_resource
    resource.build_account
    yield resource if block_given?
    respond_with resource, status: :unprocessable_entity
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [account_attributes: [:id, :name]])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end
end
