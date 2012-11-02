class Api::AppointmentTypesController < Api::BaseController

  before_filter :load_user

  def index
    @appointment_types = @user.appointment_types
    respond_with @appointment_types, :callback => params[:callback]
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end