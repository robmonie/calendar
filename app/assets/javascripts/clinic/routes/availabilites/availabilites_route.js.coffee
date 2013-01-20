Calendar.AvailabilitiesRoute = Ember.Route.extend

  model: ->
    Calendar.Availability.find()

  setupController: (controller, model) ->
    controller.set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo)

    toolbarAction: (actionName) ->
      @[actionName]()



