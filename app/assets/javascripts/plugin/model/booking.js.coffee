CalendarPlugin.Booking = Ember.Object.extend
  user:             null
  appointmentType:  null
  date:             null
  timeslot:         null
  clientName:       null
  clientEmail:      null
  clientPhone:      null
  comments:         null


  submit: ->

    data = {
      user_id: @getPath('user.id')
      appointment_type_id: @getPath('appointmentType.id')
      start_time: @getPath('timeslot.startTime')
      client_name: @getPath('clientName')
      client_email: @getPath('clientEmail')
      client_phone: @getPath('clientPhone')
      comments: @getPath('comments')
    }

    alert(data)
