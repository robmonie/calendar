Calendar.AppointmentTypesEditControllerMixin = Ember.Mixin.create

  indexRoute: 'appointmentTypes'
  needs: ['appointmentTypes']

  getIndexController: ->
    @get('controllers.appointmentTypes')
