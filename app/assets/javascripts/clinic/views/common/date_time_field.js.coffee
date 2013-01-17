Calendar.DateTimeField = Ember.TextField.extend

  classNames: ['date-time-field']
  stepMinute: 5

  didInsertElement: ->
    @$().datetimepicker
      dateFormat: Calendar.DATE_FORMAT
      timeFormat: Calendar.TIME_FORMAT
      stepMinute: @get('stepMinute')
      # addSliderAccess: true
      # sliderAccessArgs: { touchonly: true }

  willDestroyElement: ->
    @$().datetimepicker('destroy')