class AdminsController < ApplicationController

  #include Pundit
  #after_action :verify_authorized, except: [:dashboard, :applications_statistics]
  #skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  layout "admin"

  #rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized
  
  def dashboard
    # @application_states_count = Application.all
    # @statistics = Application.get_count_by_month
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end 
  end 



  def applications_statistics
    respond_to do |format|
      @statistics = Application.get_count_by_month(params[:year])
      format.json do 
        render json: {statistics: @statistics}
      end 
    end 
  end 
  
  private

  # def pundit_user
  #   current_admin
  # end 
end
