Calendar.EditControllerMixin = Ember.Mixin.create

  save: ->
    Calendar.store.commit()
    @transitionToRoute(@get('saveTargetRoute'))

  close: ->
    model = @get('content')
    if model.get('isNew')
      model.deleteRecord()
    else if model.get('isDirty')
      Calendar.store.defaultTransaction.rollback()

    @transitionToRoute(@get('closeTargetRoute'))

