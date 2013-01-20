Calendar.AvailabilitiesEditControllerMixin = Ember.Mixin.create

  indexRoute: 'availabilities'

  weekdays: (->
    Calendar.WEEK_DAYS
  ).property()

  hours: (->
    [0..23].map (hour) => { label: @_leftPad(hour), value: hour }
  ).property()

  minutes: (->
    [0, 15, 30, 45].map (minute) => { label: @_leftPad(minute), value: minute }
  ).property()


  _leftPad: (value) ->
    if value < 10
      "0#{value}"
    else
      value.toString()
