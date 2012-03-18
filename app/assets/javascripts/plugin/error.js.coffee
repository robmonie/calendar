CalendarPlugin.Error = Ember.Object.extend

  required: null
  email: null

  display: (->
    [@get('required'), @get('email')].join("<br/>")
  ).property('required', 'email').cacheable()

  hasError: (->
    @get('required') or @get('email')
  ).property('required', 'email').cacheable()