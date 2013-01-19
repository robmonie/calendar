Calendar.AppointmentsController = Ember.ArrayController.extend

  templateName: 'appointments'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')