class Api::TimeslotsController < Api::BaseController

  before_filter :load_user

  def index
    @timeslots = Timeslot.find_available(@user, Time.parse(params[:date]), Integer(params[:duration]))
    respond_with @timeslots
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end