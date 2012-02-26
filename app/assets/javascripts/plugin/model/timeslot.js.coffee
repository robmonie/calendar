CalendarPlugin.Timeslot = Ember.Object.extend
  startTime:  null
  endTime:    null

  label: (->
    start = @get 'startTime'
    end =   @get 'endTime'
    if start and end
      "#{CalendarPlugin.date.formatTime(start)} - #{CalendarPlugin.date.formatTime(end)}"
  ).property 'startTime', 'endTime'

  value: (->
    CalendarPlugin.date.formatForServer(@get 'startTime')
  ).property 'startTime'


CalendarPlugin.Timeslot.reopenClass

  findAllForUserAndDate: (user, date, duration) ->

    timeslots = []
    timeslots.beginPropertyChanges()
    timeslots.set 'status', 'loading'

    req = $.ajax
      url: "/api/users/#{user.id}/timeslots?date=#{CalendarPlugin.date.formatForServer(date)}&duration=#{duration}"
      type: 'GET'
      dataType: 'json'
    req.done (data)=>
      data.forEach (item) ->
        timeslots.push CalendarPlugin.Timeslot.create
          startTime:  new Date(Date.parse(item.start_time))
          endTime:    new Date(Date.parse(item.end_time))

      timeslots.set 'status', 'ready'
      timeslots.endPropertyChanges()

    req.fail (e)->
      timeslots.set 'status', 'error'
      timeslots.endPropertyChanges()
      console.error 'failed loading timeslots'

    timeslots