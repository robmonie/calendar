Calendar.EditControllerMixin = Ember.Mixin.create
  save: ->
    Calendar.store.commit()
    @transitionToRoute(@get('saveTargetRoute'))

  close: ->
    record = @get('content')
    if record.get('isNew')
      record.deleteRecord()
    else if record.get('isDirty')
      Calendar.store.defaultTransaction.rollback()

    @transitionToRoute(@get('closeTargetRoute'))