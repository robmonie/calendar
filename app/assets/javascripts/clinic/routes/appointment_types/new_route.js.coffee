#= require ../edit_route_mixin
Calendar.AppointmentTypesNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  baseRoute: 'appointmentTypes'

  model: ->
    Calendar.AppointmentType.createRecord()
