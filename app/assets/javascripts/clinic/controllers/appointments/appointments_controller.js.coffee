#= require ../scheduled_deletion_commit_controller_mixin
Calendar.AppointmentsController = Ember.ArrayController.extend Calendar.ScheduledDeletionCommitControllerMixin,

  templateName: 'appointments'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')