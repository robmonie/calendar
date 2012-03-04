CalendarPlugin.SelectAppointmentView = Ember.View.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/select_appointment"

  isVisible: (->
    CalendarPlugin.bookingController.get('currentWizardPage') == 1
  ).property('CalendarPlugin.bookingController.currentWizardPage')

  hideTimeslotsSelect: (->
    @getPath('content.booking.date')? and !@getPath('content.timeslots.length') and @getPath('content.timeslots.status') == 'ready'
  ).property('content.booking.date', 'content.timeslots', 'content.timeslots.status')

  UserSelectFieldView: Ember.Select.extend
    contentBinding:   Ember.Binding.oneWay 'parentView.content.users'
    selectionBinding: 'parentView.content.booking.user'
    optionLabelPath:  'content.name'
    optionValuePath:  'content.id'
    prompt:           'Select a Practitioner',
    contentDidChange: (->
      if @getPath('content.length') == 1
        Em.run.next =>
          Em.run =>
            if @getPath('content.length') == 1
              @set('selection', @get('content').objectAt(0))
    ).observes('content', 'content.length')

  AppointmentTypeSelectFieldView: Ember.Select.extend
    contentBinding:   Ember.Binding.oneWay "parentView.content.appointmentTypes"
    selectionBinding: "parentView.content.booking.appointmentType"
    optionLabelPath:  'content.label'
    optionValuePath:  'content.id'
    promptBinding:    Ember.Binding.oneWay('content.status').transform (status) ->
      if status == 'loading' then "Loading Appointment Types..." else 'Select an Appointment Type'
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
    contentBinding:   Ember.Binding.oneWay "parentView.content.timeslots"
    selectionBinding: "parentView.content.booking.timeslot"
    optionLabelPath:  'content.label'
    optionValuePath:  'content.value'
    promptBinding:    Ember.Binding.oneWay('content.status').transform (status) ->
      if status == 'loading' then "Loading Available Times..." else 'Select a Time'

    attributeBindings:['disabled']
    disabledBinding:  Ember.Binding.oneWay('parentView.content.booking.date').transform((date)->
      date == null || date == undefined
    )
