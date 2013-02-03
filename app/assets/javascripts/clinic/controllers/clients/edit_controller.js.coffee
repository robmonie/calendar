#= require ../edit_controller_mixin
#= require ./edit_controller_mixin
Calendar.ClientsEditController = Ember.ObjectController.extend Calendar.EditControllerMixin, Calendar.ClientsEditControllerMixin,

  nextAppointment: (->
    now = new Date()
    appointments = @get('appointments').toArray()
    sorted = _.sortBy appointments, (appointment) ->
      appointment.get('startTime')

    _.find sorted, (appointment) ->
      appointment.get('endTime') > now

  ).property('appointments.@each.endTime').cacheable()

  preventDelete: (->
    !!@get('appointments.length')
  ).property('appointments.length')

