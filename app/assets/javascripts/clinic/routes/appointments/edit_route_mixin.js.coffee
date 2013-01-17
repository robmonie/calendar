Calendar.AppointmentsEditRouteMixin = Ember.Mixin.create

  setupController: (controller, model) ->
    console.log 'setiup'
    controller.set('content', model)
    controller.set('clients', Calendar.Client.find())
    @controllerFor('appointments').set('isEditing', true)

  exit: ->
    @controllerFor('appointments').set('isEditing', false)
