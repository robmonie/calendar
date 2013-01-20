#= require ../scheduled_deletion_commit_controller_mixin

Calendar.AvailabilitiesController = Ember.ArrayController.extend Calendar.ScheduledDeletionCommitControllerMixin,

  templateName: 'availabilities'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')