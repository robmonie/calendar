#= require clinic/transforms
Calendar.AppointmentsNewController = Ember.ObjectController.extend

  clients: []
  startTime: Calendar.transforms.dateString('content.startTime')
  endTime: Calendar.transforms.dateString('content.endTime')