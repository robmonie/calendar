class Api::Public::AppointmentTypesController < Api::Public::BaseController

  before_filter :load_user

  def index
    @appointment_types = @user.appointment_types
    render :json => @appointment_types
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end