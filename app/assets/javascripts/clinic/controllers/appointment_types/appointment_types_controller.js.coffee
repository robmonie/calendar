#= require ../scheduled_deletion_commit_controller_mixin
Calendar.AppointmentTypesController = Ember.ArrayController.extend Calendar.ScheduledDeletionCommitControllerMixin,

  templateName: 'appointment_types'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')