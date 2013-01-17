#= require ./edit_route_mixin
Calendar.AppointmentsNewRoute = Ember.Route.extend Calendar.AppointmentsEditRouteMixin,

  model: ->
    Calendar.Appointment.createRecord()

