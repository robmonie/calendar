#= require clinic/transforms
Calendar.AppointmentsEditControllerMixin = Ember.Mixin.create

  clients: null
  appointments: null

  needs: ['appointments']
  indexRoute: 'appointments'

  getIndexController: ->
    @get('controllers.appointments')

  overlappingAppointment: (->
    start = @get('content.startTime')
    end = @get('content.endTime')
    appointments = @get('controllers.appointments')
    currentAppointment = @get('content')

    if start && end
      overlapping = appointments.find (appointment) =>
        if appointment != currentAppointment
          appointmentStart = appointment.get('startTime')
          appointmentEnd = appointment.get('endTime')
          (appointmentStart <= start && appointmentEnd > start) || (appointmentStart >= start && appointmentStart < end)
    else
      null

    overlapping


  ).property('content.startTime', 'content.endTime', 'appointments.length').cacheable()
