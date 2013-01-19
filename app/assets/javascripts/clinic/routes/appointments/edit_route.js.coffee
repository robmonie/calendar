#= require ../edit_route_mixin
Calendar.AppointmentsEditRoute = Ember.Route.extend Calendar.EditRouteMixin,

  indexRoute: 'appointments'

  setupControllerExtras: (controller, model) ->
    controller.set('clients', Calendar.Client.find())
