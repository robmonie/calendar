
leftPad = (value) ->
  if value < 10
    "0#{value}"
  else
    value.toString()


HOURS = [0..23].map (hour) => { label: leftPad(hour), value: hour }
MINUTES = [0, 15, 30, 45].map (minute) => { label: leftPad(minute), value: minute }

Calendar.AvailabilitiesEditControllerMixin = Ember.Mixin.create

  needs: ['availabilities']

  getIndexController: ->
    @get('controllers.availabilities')

  indexRoute: 'availabilities'

  weekdays: (->
    Calendar.WEEK_DAYS
  ).property()

  hours: (->
    HOURS
  ).property()

  minutes: (->
    MINUTES
  ).property()


