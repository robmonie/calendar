businessId = null
form = practitionerField = appointmentTypeField = dateField = startTimeField = submitField = null
clientSelectField = clientNameField = clientEmailField = clientPhoneField = dates = null

window.Calendar = {

  ready: (options)->

    businessId = options.businessId
    form = $("form")
    practitionerField = form.find('[name="appointment[user_id]"]')
    appointmentTypeField = form.find('[name="appointment[appointment_type_id]"]')
    dateField = form.find('[name="date"]')
    startTimeField = form.find('[name="appointment[start_time]"]')
    # submitField = form.find('.submit')
    clientSelectField = $("[name='appointment[client_id]']")
    clientNameField = $("[name='appointment[client[name]]']")
    clientEmailField = $("[name='appointment[client[email]]']")
    clientPhoneField = $("[name='appointment[client[phone]]']")

    practitionerField.on 'change', handlePractitionerFieldChange
    appointmentTypeField.on 'change', handleAppointmentFieldChange
    dateField.on 'change', handleDateFieldChange
    clientSelectField.on 'change', handleClientSelectFieldChange

    practitionerOptions = practitionerField.find('option')
    if practitionerOptions.length == 2
      practitionerField.val($(practitionerOptions[1]).attr('value')).trigger('change')

    form.validate
      rules:
        'appointment[user_id]':
          required: true
        'appointment[appointment_type_id]':
          required: true
        'appointment[start_time]':
          required: true
        'appointment[client[name]]':
          required: true
        'appointment[client[email]]':
          required: options.public
          email: true
        'appointment[client[phone]]':
          required: options.public
        'appointment[client[comments]]':
          maxlength: 2000

      errorPlacement: (error, element) ->
        error.appendTo(element.closest(".controls")).addClass('help-inline')
      highlight: (element, errorClass) ->
        $(element).closest('.control-group').addClass('error')
      unhighlight: (element, errorClass) ->
        $(element).closest('.control-group').removeClass('error')

}

handlePractitionerFieldChange = ->
  userId = $(this).val()
  if userId
    appointmentTypeField.html("<option value=''>Loading appointment types...</option>")
    $.ajax
      type: 'GET'
      url: "/api/public/users/#{userId}/appointment_types.json"
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        optionsHtml = "<option value=''>Select an appointment type</option>"
        for item in data.appointment_types
          optionsHtml = optionsHtml + "<option value='#{item.id}'>#{item.name}: $#{Number(item.price).toFixed(2)} (#{item.duration} mins)</option>"
        appointmentTypeField.html(optionsHtml)
        # appointmentTypeField.removeAttr('disabled')

      failure: (response, statusText, statusMessage) =>
        throw statusMessage

    $.ajax
      type: 'GET'
      url: "/api/public/users/#{userId}/dates.json"
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        dates = data.dates

      failure: (response, statusText, statusMessage) =>
        throw statusMessage

  else
    resetField(appointmentTypeField)
    resetField(dateField)
    resetField(startTimeField)

handleAppointmentFieldChange = ->
  if $(this).val()
    optionsHtml = "<option value=''>Select a date</option>"
    for dateStr in dates
      date = new XDate(dateStr)
      optionsHtml = optionsHtml + "<option value='#{dateStr}'>#{date.toString('dd/MM/yy - ddd')}</option>"
      dateField.html(optionsHtml)
  else
    resetField(dateField)
    resetField(startTimeField)

handleDateFieldChange = ->

  dateString = $(this).val()
  userId = practitionerField.val()
  appointmentTypeId = appointmentTypeField.val()
  if dateString && userId && appointmentTypeId
    startTimeField.html("<option value=''>Loading times...</option>")
    $.ajax
      type: 'GET'
      url: "/api/public/users/#{userId}/timeslots.json"
      dataType: 'json'
      data:
        date: dateString
        appointment_type_id: appointmentTypeId
      success: (data, textStatus, jqXHR) =>
        timeslots = data.timeslots
        optionsHtml = "<option value=''>Select a time</option>"
        for item in timeslots
          date = new XDate(item.start_time)
          optionsHtml = optionsHtml + "<option value='#{item.start_time}'>#{date.toString('hh:mm TT')}</option>"
        startTimeField.html(optionsHtml)

        if timeslots.length
          form.find('.no-appointment-times').hide()
          startTimeField.show()
        else
          form.find('.no-appointment-times').show()
          startTimeField.hide()


      failure: (response, statusText, statusMessage) =>
        throw statusMessage
  else
    resetField(startTimeField)



handleClientSelectFieldChange = ->
  clientId = clientSelectField.val()
  if !clientId
    clientNameField.val('')
    clientEmailField.val('')
    clientPhoneField.val('')
  else
    req = $.ajax
      url: "/api/public/businesses/#{businessId}/clients/#{clientId}"
      type: 'GET'
      dataType: 'json'
    req.done (data) =>
      client = data.client
      clientNameField.val(client.name)
      clientEmailField.val(client.email)
      clientPhoneField.val(client.phone)
    req.fail (e)->


resetField = (field) ->
  field.val('').trigger('change')
  field.html('')
  # field.attr('disabled', true)


leftPad =  (val, size, ch) ->
  result = String(val)
  ch = " " if !ch

  while result.length < size
    result = ch + result

  result

days = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat']

