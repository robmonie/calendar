Calendar.AppointmentTypesRoute = Ember.Route.extend
  model: ->
    Calendar.AppointmentType.find()

  setupController: (controller, model) ->
    @controllerFor('appointmentTypesList').set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo.replace('/', '.'))

    toolbarAction: (actionName) ->
      @[actionName]()



