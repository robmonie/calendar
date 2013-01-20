#= require ../edit_route_mixin
Calendar.ClientsNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  indexRoute: 'clients'

  model: ->
    Calendar.Client.createRecord()
