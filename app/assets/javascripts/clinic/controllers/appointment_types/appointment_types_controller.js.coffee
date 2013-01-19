Calendar.AppointmentTypesController = Ember.ArrayController.extend

  templateName: 'appointment_types'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')