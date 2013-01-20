Calendar.AppointmentsEditRouteMixin = Ember.Mixin.create

  setupControllerExtras: (controller, model) ->
    controller.set('clients', Calendar.Client.find())
    controller.set('appointmentTypes', Calendar.AppointmentType.find())
    controller.set('appointments', Calendar.Appointment.find())
