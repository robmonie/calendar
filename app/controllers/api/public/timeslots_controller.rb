class Api::Public::TimeslotsController < Api::Public::BaseController

  before_filter :load_user

  def index
    appointment_type = AppointmentType.find(params[:appointment_type_id])
    user = appointment_type.user
    @timeslots = Timeslot.find_available(@user, DateTime.parse(params[:date]).in_time_zone(user.timezone), appointment_type.duration)
    respond_with @timeslots
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end