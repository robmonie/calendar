#= require ../scheduled_transaction_commit_controller_mixin
Calendar.ClientsController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'clients'
  editController: null
  sortProperties: ['name']


  isEditing: (->
    @get('editController') != null
  ).property('editController')
