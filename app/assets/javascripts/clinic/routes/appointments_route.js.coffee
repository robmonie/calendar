Calendar.AppointmentsRoute = Ember.Route.extend
  model: ->
    Calendar.Appointment.find()

  setupController: (controller, model) ->
    @controllerFor('appointmentsTable').set('content', model)

  events:
    toolbarLink: (linkTo) ->
      @transitionTo(linkTo.replace('/', '.'))

    toolbarAction: (actionName) ->
      @[actionName]()

    save: ->
      Calendar.store.commit()



