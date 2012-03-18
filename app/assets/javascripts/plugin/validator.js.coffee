CalendarPlugin.Validator = Ember.Object.extend

  host: null

  init: ->
    @_super()
    host = @get('host')
    validationGroup = host.nearestWithProperty('validationGroup')?.get('validationGroup')
    if validationGroup
      @set('validationGroup', validationGroup)
      validationGroup.notifyValidity(this, false)

    @set('rules', rules = [])
    @set('required', host.get('required'))
    rules = @get('rules')
    if @get('required')
      rules.pushObject(CalendarPlugin.validatorRegistry.required)
    else
      rules.removeObject(CalendarPlugin.validatorRegistry.required)


  validate: ((value)->

    errors = @get('errors')
    rules = @get('rules')
    errorMessages = []

    for rule in rules
      errorMessages.pushObject(rule.message) if not rule.validate(value)

    @get('host').set('errorMessages', errorMessages)
  )

  destroy: ->
    @get('validationGroup')?.unregister(this)
    @_super()

  notifyValidity: (->
    @get('validationGroup')?.notifyValidity(this, @getPath('host.errorMessages.length') == 0)
  ).observes('host.errorMessages')




