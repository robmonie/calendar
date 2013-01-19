Calendar.AppointmentTypesRoute = Ember.Route.extend
  model: ->
    Calendar.AppointmentType.find()

  setupController: (controller, model) ->
    controller.set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo)

    toolbarAction: (actionName) ->
      @[actionName]()



