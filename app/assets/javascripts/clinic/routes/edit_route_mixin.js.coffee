Calendar.EditRouteMixin = Ember.Mixin.create

  setupController: (controller, model) ->

    currentModel = controller.get('content')
    if currentModel && currentModel.get('isDirty')
      @transitionTo(@templateName, currentModel)
    else
      controller.set('content', model)
      controller.set('isEditing', true)
      @setupControllerExtras(controller, model)

  #implement in consumers of this mixin to provide extra controller setup
  setupControllerExtras: ->

  exit: ->
    @controllerFor(@templateName).set('isEditing', false)
