#= require ../scheduled_transaction_commit_controller_mixin
Calendar.AppointmentsController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'appointments'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')