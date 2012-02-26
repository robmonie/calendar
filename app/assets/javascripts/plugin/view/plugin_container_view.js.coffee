CalendarPlugin.PluginContainerView = Ember.View.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/plugin_container"

  UserSelectFieldView: Ember.Select.extend
    contentBinding: SC.Binding.oneWay "parentView.content.users"
    selectionBinding:   "parentView.content.booking.user"
    optionLabelPath:  'content.name'
    optionValuePath:  'content.id'
    prompt:           'Select a User'

  AppointmentTypeSelectFieldView: Ember.Select.extend
    contentBinding:   SC.Binding.oneWay "parentView.content.appointmentTypes"
    selectionBinding: "parentView.content.booking.appointmentType"
    optionLabelPath:  'content.label'
    optionValuePath:  'content.id'
    prompt:           'Select an Appointment Type'
    attributeBindings:['disabled']
    disabledBinding:  Ember.Binding.oneWay('parentView.content.booking.user').transform((user)->
      user == null || user == undefined
    )

  DateSelectFieldView: Ember.Select.extend
    contentBinding:   SC.Binding.oneWay "parentView.content.dates"
    selectionBinding: "parentView.content.booking.date"
    optionLabelPath:  'content.label'
    optionValuePath:  'content.date'
    prompt:           'Select a Date'
    attributeBindings:['disabled']
    disabledBinding:  Ember.Binding.oneWay('parentView.content.booking.appointmentType').transform((appointmentType)->
      appointmentType == null || appointmentType == undefined
    )

  TimeslotSelectFieldView: Ember.Select.extend
    contentBinding:   SC.Binding.oneWay "parentView.content.timeslots"
    selectionBinding: "parentView.content.booking.timeslot"
    optionLabelPath:  'content.label'
    optionValuePath:  'content.value'
    prompt:           'Select a Time'
    attributeBindings:['disabled']
    disabledBinding:  Ember.Binding.oneWay('parentView.content.booking.date').transform((date)->
      date == null || date == undefined
    )


