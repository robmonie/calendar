#= require ../scheduled_deletion_commit_controller_mixin
Calendar.ClientsController = Ember.ArrayController.extend Calendar.ScheduledDeletionCommitControllerMixin,

  templateName: 'clients'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')