#= require ../scheduled_transaction_commit_controller_mixin

Calendar.AvailabilitiesController = Ember.ArrayController.extend Calendar.ScheduledTransactionCommitControllerMixin,

  templateName: 'availabilities'
  editController: null
  sortProperties: ['weekdayIndex', 'startHour', 'startMinute']

  isEditing: (->
    @get('editController') != null
  ).property('editController')