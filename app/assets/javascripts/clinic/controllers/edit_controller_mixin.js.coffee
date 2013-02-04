Calendar.EditControllerMixin = Ember.Mixin.create

  needs: ['application']

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

    @getIndexController().set('isDirty', false)
    @transitionToRoute(@get('indexRoute'))

  delete: ->
    @get('content').deleteRecord()
    @get('controllers.application').scheduleCommitOnTransaction(Calendar.store.defaultTransaction)
    @transitionToRoute(@get('indexRoute'))
