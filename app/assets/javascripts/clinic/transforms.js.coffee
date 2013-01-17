
Calendar.transforms =
  dateString: (from, placeholder) ->
    return Ember.computed((key, value) ->
      if arguments.length == 1
        date = @get('content.' + key)
        if date
          dateString = $.datepicker.formatDate(Calendar.DATE_FORMAT, date)
          timeString = $.datepicker.formatTime(Calendar.TIME_FORMAT, date)
          dateString + " " + timeString
        else
          ""
      else
        dateValue = if value then $.datepicker.parseDateTime(Calendar.DATE_FORMAT, Calendar.TIME_FORMAT, value) else null
        @set('content.' + key, dateValue)
    ).property(from)
