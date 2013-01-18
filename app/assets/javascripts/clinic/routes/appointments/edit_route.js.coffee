#= require ../edit_route_mixin
Calendar.AppointmentsEditRoute = Ember.Route.extend Calendar.EditRouteMixin,

  baseRoute: 'appointments'

  model: (params) ->
    Calendar.Appointment.find(params.id)
