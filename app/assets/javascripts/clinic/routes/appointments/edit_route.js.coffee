#= require ./edit_route_mixin
Calendar.AppointmentsEditRoute = Ember.Route.extend Calendar.AppointmentsEditRouteMixin,

  model: (params) ->
    Calendar.Appointment.find(params.appointment_id)
