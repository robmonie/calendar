Calendar.AppointmentTypesController = Ember.ArrayController.extend

  templateName: 'appointment_types'
  editController: null
  sortProperties: ['name']

  isEditing: (->
    @get('editController') != null
  ).property('editController')
