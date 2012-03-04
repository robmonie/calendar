class CalendarEventService

  attr_accessor :event

  def self.find_all(user)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    result = client.execute!(:api_method => service.events.list, :parameters => {'calendarId' => 'primary'})
    result.data.items
  end

  def self.find_all_by_date(user, date)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')

    params = {
      'calendarId' => 'primary',
      'singleEvents' => 'true',
      'showDeleted' => 'false',
      'orderBy' => 'startTime',
      'timeMin' => self.date_for_google(date, user.timezone),
      'timeMax' => self.date_for_google(date + 1.days, user.timezone),
      'timeZone' => user.timezone
    }
    puts params
    result = client.execute!(:api_method => service.events.list, :parameters => params)
    result.data.items
  end

  def self.find_busy_times_by_date(user, date)

    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')

    params = {
      'timeMin' => self.date_for_google(date, user.timezone),
      'timeMax' => self.date_for_google(date + 1.days, user.timezone),
      'timeZone' => user.timezone,
      'items' => [ {'id' => user.calendar_id} ]
    }
    puts params
    result = client.execute!(
      :api_method => service.freebusy.query,
      :body => [JSON.dump(params)],
      :headers => {'Content-Type' => 'application/json'})

    calendars = result.data.calendars
    busy = calendars[user.calendar_id].busy

    busy

  end

  def self.create(user, event_data)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    client.execute!( :api_method => service.events.insert,
                    :parameters => {'calendarId' => 'primary'},
                    :body => [JSON.dump(event_data)],
                    :headers => {'Content-Type' => 'application/json'})

  end

  def self.find_by_id(user, id)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    client.execute!(:api_method => service.events.get, :parameters => {'calendarId' => 'primary', 'eventId' => id})
  end

  def self.destroy(user, id)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    #Don't use the ! version as it can't parse properly
    client.execute(:api_method => service.events.delete, :parameters => {'calendarId' => 'primary', 'eventId' => id})
  end

  def self.date_for_google(date, time_zone)
    date.in_time_zone(time_zone).to_datetime.rfc3339
  end
end