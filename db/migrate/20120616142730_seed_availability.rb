class SeedAvailability < ActiveRecord::Migration
  def up
    Availability.create!(:user_id => 2, :start_hour => 10, :start_minute => 0, :end_hour 20, :end_minute => 0, :weekday_index = 3)
    Availability.create!(:user_id => 2, :start_hour => 10, :start_minute => 30, :end_hour 20, :end_minute => 0, :weekday_index = 5)
    Availability.create!(:user_id => 2, :start_hour => 10, :start_minute => 0, :end_hour 17, :end_minute => 0, :weekday_index = 6)
  end

  def down
  end
end
