CalendarPlugin.validatorRegistry =

  required:
    errorKey: 'required'
    validate: (value) ->
      if value then true else false
    message: "Field is required"
