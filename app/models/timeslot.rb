class Timeslot

  attr_accessor :start_time, :end_time

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def self.find_available(user, date, duration)
    events_for_day = CalendarEventService.find_all_by_date(user, date)
    events_for_day.each do |event|
    puts event.inspect
    end
    timeslots = []
    tomorrow = date + 1.days
    timeslot_start = date
    while(timeslot_start < tomorrow)
      timeslot_end = timeslot_start + duration.minutes
      timeslot = Timeslot.new(:start_time => timeslot_start, :end_time => timeslot_end)
      if self.is_timeslot_available(events_for_day, timeslot)
        timeslots.push timeslot
      end
      timeslot_start = timeslot_end
    end

    timeslots
  end

  def self.is_timeslot_available(events_for_day, timeslot)

    available = true

    events_for_day.each do |event|
      start_time = Time.parse(event.start.dateTime)
      end_time = Time.parse(event.end.dateTime)
      if ! (timeslot.start_time < start_time && timeslot.end_time <= start_time || timeslot.start_time >= end_time && timeslot.end_time > end_time)
        available = false
        break
      end
    end

    available

  end

end