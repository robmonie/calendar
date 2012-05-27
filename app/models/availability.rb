class Availability < ActiveRecord::Base

  validates_presence_of :weekday_index, :start_hour, :start_minute, :end_hour, :end_minute, :user

  belongs_to :user

  def self.find_by_user_for_day(user, day)
    Availability.where('user_id = ? AND weekday_index = ?', user.id, day.wday)
  end


end