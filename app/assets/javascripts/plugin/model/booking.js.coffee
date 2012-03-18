CalendarPlugin.Booking = Ember.Object.extend
  user:             null
  appointmentType:  null
  date:             null
  timeslot:         null
  clientName:       null
  clientEmail:      null
  clientPhone:      null
  comments:         null

  # init: ->
  #   @_super()
  #   @set('errors', CalendarPlugin.Errors.create(errorKeys: []))

  # validateMandatory: ((sender, key, value) ->
  #   errors = @get('errors')
  #   error = errors.get(key) || CalendarPlugin.Error.create()
  #   errors.set(key, error)
  #   errorKeys = errors.get('errorKeys')
  #   if value
  #     error.set('required', null)
  #     errorKeys.removeObject(key)
  #   else
  #     error.set('required', "Required field")
  #     errorKeys.pushObject(key)

  # ).observes("user", "appointmentType", "timeslot", "clientName", "clientEmail", "clientPhone")



  formData: ->

    {
      appointment_type_id: @getPath('appointmentType.id')
      start_time: @getPath('timeslot.startTime').toString()
      client: {
        name: @getPath('clientName')
        email: @getPath('clientEmail')
        phone: @getPath('clientPhone')
      }
      comments: @getPath('comments')
    }


