CalendarPlugin.AppointmentType = Ember.Object.extend
  name:       null
  duration:   null
  price:      null

CalendarPlugin.AppointmentType.reopenClass

  findAllForUser: (user) ->

    appointmentTypes = []
    appointmentTypes.beginPropertyChanges()
    appointmentTypes.set 'status', 'loading'

    req = $.ajax
      url: "/api/users/#{user.id}/appointment_types"
      type: 'GET'
      dataType: 'json'
    req.done (data)=>
      data.forEach (item) ->
        appointmentTypes.push CalendarPlugin.Timeslot.create
          name:       item.name
          duration:   parseInt(item.duration)
          price:      parseFloat(item.price)
          label:      "#{item.name}: #{item.duration}mins ($#{item.price})"

      appointmentTypes.set 'status', 'ready'
      appointmentTypes.endPropertyChanges()

    req.fail (e)->
      appointmentTypes.set 'status', 'error'
      appointmentTypes.endPropertyChanges()
      console.error 'failed loading appointmentTypes'

    appointmentTypes