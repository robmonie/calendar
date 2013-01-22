#= require ../scheduled_transaction_commit_controller_mixin
Calendar.ClientsController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'clients'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')