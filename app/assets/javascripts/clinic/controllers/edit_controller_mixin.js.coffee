Calendar.EditControllerMixin = Ember.Mixin.create

  save: ->
    if validationGroup = @get('validationGroup')
      validationGroup.validate()
      return unless validationGroup.get('isValid')

    Calendar.store.commit()
    @transitionToRoute(@get('indexRoute'))

  close: ->
    model = @get('content')
    if model.get('isNew')
      model.deleteRecord()
    else if model.get('isDirty')
      Calendar.store.defaultTransaction.rollback()

    @controllerFor(@get('indexRoute')).set('isDirty', false)
    @transitionToRoute(@get('indexRoute'))
