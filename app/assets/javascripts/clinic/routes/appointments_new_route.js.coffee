Calendar.AppointmentsNewRoute = Ember.Route.extend

  model: ->
    Calendar.Appointment.createRecord(startTime: new Date())

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set('clients', Calendar.Client.find())
    @controllerFor('appointments').set('isEditing', true)

  exit: ->
    @controllerFor('appointments').set('isEditing', false)
