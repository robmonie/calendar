Ember.Handlebars.registerBoundHelper 'zeroPad', (number, options) ->
  return "" if typeof number != 'number'

  finalLength = parseInt(options.hash.length)
  val = String(number)
  currentLength = val.length
  padBy = finalLength - currentLength
  if padBy > 0
    Array(padBy + 1).join("0") + val
  else
    val


