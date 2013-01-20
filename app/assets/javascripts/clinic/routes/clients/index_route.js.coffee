Calendar.ClientsRoute = Ember.Route.extend

  model: ->
    Calendar.Client.find()

  setupController: (controller, model) ->
    controller.set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo)

    toolbarAction: (actionName) ->
      @[actionName]()



