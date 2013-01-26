#= require ../scheduled_transaction_commit_controller_mixin
Calendar.AppointmentTypesController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'appointment_types'
  editController: null
  sortProperties: ['name']

  isEditing: (->
    @get('editController') != null
  ).property('editController')