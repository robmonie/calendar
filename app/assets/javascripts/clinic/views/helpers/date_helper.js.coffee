Ember.Handlebars.registerBoundHelper 'date', (date, options) ->

  format = options.hash.format
  if date
    new XDate(date).toString(format || 'u')
  else
    ""
