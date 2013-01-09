class Timeslot

  attr_accessor :start_time, :end_time

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def self.find_available(user, date, duration)
    unavailable_timeslots = []

    Appointment.find_by_user_and_day(user, date).each do |appointment|
      unavailable_timeslots.push(Timeslot.new(:start_time => appointment.start_time, :end_time => appointment.end_time))
    end

    user.unavailabilities.in_future.each do |unavailability|
      unavailable_timeslots.push(Timeslot.new(:start_time => unavailability.start_time, :end_time => unavailability.end_time))
    end

    timeslots = []

    Availability.find_by_user_for_day(user, date).each do |availability|

      availability_start_time = date.beginning_of_day + availability.start_hour.hours + availability.start_minute.minutes
      availability_end_time = date.beginning_of_day + availability.end_hour.hours + availability.end_minute.minutes
      timeslot_start = availability_start_time

      now = DateTime.now
      now = now.change(:sec => 0)
      if timeslot_start < now
        timeslot_start = now + (60 - now.min + 60).minutes
      end

      timeslot_end = timeslot_start + duration.minutes

      while(timeslot_start < availability_end_time && timeslot_end <= availability_end_time)
        timeslot = Timeslot.new(:start_time => timeslot_start, :end_time => timeslot_end)
        if overlaps_with = self.find_overlapping_timeslot(unavailable_timeslots, timeslot)
          # start the next slot at the end of the overlapping appointment
          timeslot_start = overlaps_with.end_time
        else
          timeslots << timeslot
          timeslot_start = timeslot_start + 30.minutes
        end

        timeslot_end = timeslot_start + duration.minutes
      end

    end

    timeslots
  end

  def self.find_overlapping_timeslot(unavailable_timeslots, timeslot)
    overlaps_with = nil
    unavailable_timeslots.each do |unavailable|
      if ! ((timeslot.start_time < unavailable.start_time && timeslot.end_time <= unavailable.start_time) || (timeslot.start_time >= unavailable.end_time && timeslot.end_time > unavailable.end_time))
        overlaps_with = unavailable
        break
      end
    end
    overlaps_with
  end

end