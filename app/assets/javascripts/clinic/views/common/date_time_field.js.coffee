Calendar.DateTimeField = Ember.TextField.extend

  stepMinute: 5

  didInsertElement: ->
    @$().datetimepicker(stepMinute: @get('stepMinute'))

  willDestroyElement: ->
    @$().datetimepicker('destroy')