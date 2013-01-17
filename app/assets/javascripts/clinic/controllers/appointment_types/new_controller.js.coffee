Calendar.AppointmentTypesNewController = Ember.ObjectController.extend

  save: ->
    Calendar.store.commit()