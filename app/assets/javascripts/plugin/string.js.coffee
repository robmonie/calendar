CalendarPlugin.string = {
  leftPad: (val, size, ch) ->
    result = String(val)
    ch = " " if !ch

    while result.length < size
      result = ch + result

    result
}