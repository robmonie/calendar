#= require ../edit_route_mixin
#= require ./edit_route_mixin
Calendar.AppointmentsNewRoute = Ember.Route.extend Calendar.EditRouteMixin, Calendar.AppointmentsEditRouteMixin,

  indexRoute: 'appointments'

  model: ->
    Calendar.Appointment.createRecord()

