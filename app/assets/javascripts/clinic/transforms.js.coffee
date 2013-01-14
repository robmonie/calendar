Calendar.transforms =
  dateString: (from, placeholder) ->
    return Ember.computed((key, value) ->
      if arguments.length == 1
        @get('content.' + key)?.toString()
      else
        dateValue = if value then new Date(Date.parse(value)) else null
        @set('content.' + key, dateValue)
    ).property(from)
