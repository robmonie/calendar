Calendar.AvailabilitiesController = Ember.ArrayController.extend

  templateName: 'availabilities'
  editController: null
  sortProperties: ['weekdayIndex', 'startHour', 'startMinute']

  isEditing: (->
    @get('editController') != null
  ).property('editController')