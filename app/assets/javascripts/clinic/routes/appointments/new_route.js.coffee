#= require ../edit_route_mixin
Calendar.AppointmentsNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  baseRoute: 'appointments'

  model: ->
    Calendar.Appointment.createRecord()

