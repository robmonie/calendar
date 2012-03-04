class CalendarService

  def self.find_calendar_meta_for_user(user)

    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')

    result = client.execute(:api_method => service.calendars.get,
                          :parameters => {'calendarId' => 'primary'})

    result.data

  end
end