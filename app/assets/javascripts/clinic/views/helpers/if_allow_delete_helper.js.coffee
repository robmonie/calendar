Ember.Handlebars.registerHelper 'ifAllowDelete', (options) ->
  if !this.get('isNew') && !this.get('preventDelete')
    options.fn(this);
  else
    options.inverse(this);

