#= require ../scheduled_transaction_commit_controller_mixin
Calendar.AppointmentsController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'appointments'
  editController: null
  sortProperties: ['startTime']

  isEditing: (->
    @get('editController') != null
  ).property('editController')

  byStartDate: (->
    byStartDate = {}
    @forEach (appointment) ->
      startTime = appointment.get('startTime')
      if startTime
        startDate = new Date(startTime.getFullYear(), startTime.getMonth(), startTime.getDate())

        appointments = byStartDate[startDate] || byStartDate[startDate] = []
        appointments.push(appointment)

    asArray = []
    _.each byStartDate, (appointments, startDate) ->
      asArray.push(AppointmentsByDate.create(startDate: startDate, appointments: appointments))
    asArray

  ).property('length', '@each.startTime').cacheable()


#Locally used class
AppointmentsByDate = Ember.Object.extend
  today: null
  startDate: null
  appointments: null
  init: ->
    today = new Date()
    @set('today', new Date(today.getFullYear(), today.getMonth(), today.getDate()))
  isToday: (->
    String(@get('startDate')) == String(@get('today'))
  ).property('startDate').cacheable()