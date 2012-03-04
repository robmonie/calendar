class Api::AppointmentsController < Api::BaseController

  before_filter :load_user

  def create
    appointment = Appointment.new(params[:booking])
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end