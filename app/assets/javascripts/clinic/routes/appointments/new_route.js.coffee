#= require ../edit_route_mixin
Calendar.AppointmentsNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  indexRoute: 'appointments'

  model: ->
    Calendar.Appointment.createRecord()

  setupControllerExtras: (controller, model) ->
    controller.set('clients', Calendar.Client.find())

