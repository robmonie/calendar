#= require ../edit_route_mixin
Calendar.AppointmentsEditRoute = Ember.Route.extend Calendar.EditRouteMixin,

  baseRoute: 'appointments'

  setupControllerExtras: (controller, model) ->
    controller.set('clients', Calendar.Client.find())
