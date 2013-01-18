#= require ../edit_route_mixin
Calendar.AppointmentTypesEditRoute = Ember.Route.extend Calendar.EditRouteMixin,

  baseRoute: 'appointmentTypes'

  model: (params) ->
    Calendar.AppointmentType.find(params.appointment_type_id)
