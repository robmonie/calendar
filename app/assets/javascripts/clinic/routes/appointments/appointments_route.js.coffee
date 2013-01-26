Calendar.AppointmentsRoute = Ember.Route.extend
  model: ->
    Calendar.Appointment.find()

  setupController: (controller, model) ->
    controller.set('content', model)
    # @controllerFor('appointmentsList').set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo)

    toolbarAction: (actionName) ->
      @[actionName]()

  showToday: ->
    Calendar.mediator.trigger('showToday')