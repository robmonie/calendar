class Api::TimeslotsController < Api::BaseController

  before_filter :load_user

  def index
    appointment_type = AppointmentType.find(params[:appointment_type_id])
    @timeslots = Timeslot.find_available(@user, Time.parse(params[:date]), appointment_type.duration)
    respond_with @timeslots
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end