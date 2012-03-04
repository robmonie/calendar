CalendarPlugin.AppointmentType = Ember.Object.extend
  id:         null
  name:       null
  duration:   null
  price:      null

CalendarPlugin.AppointmentType.reopenClass

  findAllForUser: (user) ->
    appointmentTypes = []

    if user
      appointmentTypes.set 'status', 'loading'
      req = $.ajax
        url: "/api/users/#{user.id}/appointment_types"
        type: 'GET'
        dataType: 'json'
      req.done (data)=>
        Ember.run ->
          appointmentTypes.beginPropertyChanges()
          data.forEach (item) ->
            appointmentTypes.pushObject CalendarPlugin.Timeslot.create
              id:         item.id
              name:       item.name
              duration:   parseInt(item.duration)
              price:      parseFloat(item.price)
              label:      "#{item.name}: #{item.duration}mins ($#{item.price})"

          appointmentTypes.set 'status', 'ready'
          appointmentTypes.endPropertyChanges()

      req.fail (e)->
        Ember.run ->
          appointmentTypes.set 'status', 'error'
          console.error 'failed loading appointmentTypes'

    appointmentTypes