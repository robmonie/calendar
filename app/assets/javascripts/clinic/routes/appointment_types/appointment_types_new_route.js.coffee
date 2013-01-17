Calendar.AppointmentTypesNewRoute = Ember.Route.extend

  model: ->
    Calendar.AppointmentType.createRecord()

  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('appointmentTypes').set('isEditing', true)

  exit: ->
    @controllerFor('appointmentTypes').set('isEditing', false)
