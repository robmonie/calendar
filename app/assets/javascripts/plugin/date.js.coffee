MILLIS_IN_DAY = 1000 * 60 * 60 * 24

CalendarPlugin.date = {
  today: ->
    today = new Date()
    today.setHours(0,0,0,0)
    today

  addDays: (date, days) ->
    new Date(date.getTime() + (MILLIS_IN_DAY * days))

  formatForServer: (date) ->
    "#{date.getFullYear()}-#{CalendarPlugin.string.leftPad(date.getMonth() + 1, 2, '0')}-#{CalendarPlugin.string.leftPad(date.getDate(), 2, '0')}"

  formatForUser: (date) ->
    "#{CalendarPlugin.string.leftPad(date.getDate(), 2, '0')}/#{CalendarPlugin.string.leftPad(date.getMonth() + 1, 2, '0')}/#{date.getFullYear()}"

  formatTime: (date) ->
    if date.getHours() < 12
      amPm = "AM"
    else
      amPm = "PM"
    "#{CalendarPlugin.string.leftPad(date.getHours(), 2, '0')}:#{CalendarPlugin.string.leftPad(date.getMinutes(), 2, '0')} #{amPm}"

}