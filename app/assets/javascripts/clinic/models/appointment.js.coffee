Calendar.Appointment = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  comments: DS.attr 'string'
  client: DS.belongsTo('Calendar.Client')
  appointmentType: DS.belongsTo('Calendar.AppointmentType')


  endTimeHandler: (->
    startTime = @get('startTime')
    endTime = @get('endTime')
    appointmentType = @get('appointmentType')

    if startTime
      if appointmentType
        @set('endTime', new XDate(startTime).clone().addMinutes(appointmentType.get('duration')).toDate())
      else if endTime && new XDate(startTime).diffMinutes(new XDate(endTime)) <= 0
        @set('endTime', new XDate(startTime).clone().addMinutes(60).toDate())

  ).observes('startTime', 'appointmentType')
