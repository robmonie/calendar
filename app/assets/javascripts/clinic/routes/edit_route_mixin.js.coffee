Calendar.EditRouteMixin = Ember.Mixin.create

  setupController: (controller, model) ->

    currentModel = controller.get('content')
    if currentModel && currentModel.get('isDirty')
      @transitionTo(@templateName, currentModel)
    else
      controller.set('content', model)
      @controllerFor(@get('indexRoute')).set('editController', controller)
      @setupControllerExtras(controller, model)

  #implement in consumers of this mixin to provide extra controller setup
  setupControllerExtras: ->

  exit: ->
    Calendar.store.defaultTransaction.rollback() # in case we exit via browser history
    @controllerFor(@get('indexRoute')).set('editController', null)
