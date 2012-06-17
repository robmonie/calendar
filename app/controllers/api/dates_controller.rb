class Api::DatesController < Api::BaseController

  before_filter :load_user

  def index

    available_weekday_indexes = @user.availabilities.map(&:weekday_index)

    today = Date.today
    @dates =  (0..90).map do |index|
      dt = today + index.days
      if available_weekday_indexes.include? dt.wday
        dt.to_date.to_s(:db)
      end
    end

    respond_with @dates.compact
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

end