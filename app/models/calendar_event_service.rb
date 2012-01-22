class CalendarEventService

  attr_accessor :event

  def self.findAll(user)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    result = client.execute!(:api_method => service.events.list, :parameters => {'calendarId' => 'primary'})
    result.data.items
  end

  def self.create(user, event_data)
    client = GoogleApiClientFactory.client_for_user(user)
    service = client.discovered_api('calendar', 'v3')
    client.execute!( :api_method => service.events.insert,
                    :parameters => {'calendarId' => 'primary'},
                    :body => [JSON.dump(event_data)],
                    :headers => {'Content-Type' => 'application/json'})

  end

  def self.findById(user, id)
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
end