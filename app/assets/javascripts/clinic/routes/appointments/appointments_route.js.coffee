Calendar.AppointmentsRoute = Ember.Route.extend
  model: ->
    Calendar.Appointment.find()

  setupController: (controller, model) ->
    @controllerFor('appointmentsList').set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo.replace('/', '.'))

    toolbarAction: (actionName) ->
      @[actionName]()



