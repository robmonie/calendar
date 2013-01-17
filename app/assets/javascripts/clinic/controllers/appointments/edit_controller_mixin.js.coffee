#= require clinic/transforms
Calendar.AppointmentsEditControllerMixin = Ember.Mixin.create

  clients: null
  startTime: Calendar.transforms.dateString('content.startTime')
  endTime: Calendar.transforms.dateString('content.endTime')

  save: ->
    Calendar.store.commit()
    @transitionToRoute('appointments')