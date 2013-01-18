Calendar.EditRouteMixin = Ember.Mixin.create

  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor(@get('baseRoute')).set('isEditing', true)

  exit: ->
    @controllerFor(@get('baseRoute')).set('isEditing', false)
