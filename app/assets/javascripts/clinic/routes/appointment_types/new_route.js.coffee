#= require ../edit_route_mixin
Calendar.AppointmentTypesNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  indexRoute: 'appointmentTypes'

  model: ->
    Calendar.AppointmentType.createRecord()
