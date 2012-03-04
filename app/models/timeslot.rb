class Timeslot

  attr_accessor :start_time, :end_time

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def self.find_available(user, date, duration)
    unavailable_timeslots = []
    CalendarEventService.find_busy_times_by_date(user, date).each do |time_period|
      puts time_period.inspect
      puts time_period.start
      puts time_period.end
      unavailable_timeslots.push(Timeslot.new(:start_time => time_period.start, :end_time => time_period.end))
    end
    puts unavailable_timeslots.inspect
    timeslots = []
    tomorrow = date + 1.days
    now = Time.now
    if date < now
      timeslot_start = now + (60 - now.min + 60).minutes
    else
      timeslot_start = date
    end

    while(timeslot_start < tomorrow)
      timeslot_end = timeslot_start + duration.minutes
      timeslot = Timeslot.new(:start_time => timeslot_start, :end_time => timeslot_end)
      if overlaps_with = self.find_overlapping_timeslot(unavailable_timeslots, timeslot)
        # start the next slot at the end of the overlapping appointment
        timeslot_start = overlaps_with.end_time
      else
        timeslots.push timeslot
        timeslot_start = timeslot_end
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

  def self.resolve_time(date_or_time)
    begin
      dt = Time.parse(date_or_time.dateTime)
    rescue NoMethodError
      dt = Time.parse(date_or_time.date)
    end

    dt

  end

end