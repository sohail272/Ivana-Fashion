# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  #skip_before_action :check_user, only: :destroy
  #skip_before_action :authenticate_user!
  skip_before_action :require_no_authentication, only: [:new]
  layout "admin"
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    if admin_signed_in?
      flash[:notice] = "You are already signed in"
      redirect_to dashboard_admin_path(current_admin) and return
    end 
    super
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to dashboard_admin_path(current_admin) and return
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
