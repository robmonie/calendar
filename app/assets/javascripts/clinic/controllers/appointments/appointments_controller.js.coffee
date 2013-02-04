Calendar.AppointmentsController = Ember.ArrayController.extend

  templateName: 'appointments'
  editController: null
  sortProperties: ['startTime']

  isEditing: (->
    @get('editController') != null
  ).property('editController')

  byStartDate: (->
    byStartDate = {}
    @forEach (appointment) =>
      startTime = appointment.get('startTime')
      endTime = appointment.get('endTime')
      if startTime && endTime
        startDate = new Date(startTime.getFullYear(), startTime.getMonth(), startTime.getDate())
        endDate = new Date(endTime.getFullYear(), endTime.getMonth(), endTime.getDate())
        @_addDaysBetween(startDate, endDate, appointment, byStartDate)

    asArray = []
    _.each byStartDate, (appointments, startDate) ->
      asArray.push(AppointmentsByDate.create(startDate: startDate, appointments: appointments))

    asArray

  ).property('length', '@each.startTime').cacheable()


  _addDaysBetween: (startDate, endDate, appointment, byStartDate) ->
    xStart = new XDate(startDate)
    xEnd = new XDate(endDate)
    while xStart.diffDays(xEnd) >= 0
      appointments = byStartDate[xStart.toString()] || byStartDate[xStart.toString()] = []
      appointments.push(appointment)
      xStart = xStart.addDays(1)


#Locally used class
AppointmentsByDate = Ember.Object.extend
  today: null
  startDate: null
  appointments: null
  init: ->
    today = new Date()
    @set('today', new Date(today.getFullYear(), today.getMonth(), today.getDate()))
  daysFromToday: (->
    new XDate(@get('today')).diffDays(new XDate(@get('startDate')))
  ).property('startDate').cacheable()