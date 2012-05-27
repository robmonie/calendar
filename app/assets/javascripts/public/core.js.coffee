
form = practitionerField = appointmentTypeField = dateField = startTimeField = submitField = null

window.Calendar = {

  ready: (options)->

    form = $("form")
    practitionerField = form.find('[name="appointment[user_id]"]')
    appointmentTypeField = form.find('[name="appointment[appointment_type_id]"]')
    dateField = form.find('[name="date"]')
    startTimeField = form.find('[name="appointment[start_time]"]')
    submitField = form.find('.submit')

    practitionerField.on 'change', handlePractitionerFieldChange
    appointmentTypeField.on 'change', handleAppointmentFieldChange
    dateField.on 'change', handleDateFieldChange

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
          required: true
          email: true
        'appointment[client[phone]]':
          required: true
        'appointment[client[comments]]':
          maxlength: 2000

      errorPlacement: (error, element) ->
        error.appendTo(element.closest(".control-group")).addClass('help-inline')
      highlight: (element, errorClass) ->
        $(element).closest('.control-group').addClass('error')
      unhighlight: (element, errorClass) ->
        $(element).closest('.control-group').removeClass('error')

    form.find(':input').one 'focusout', (e) =>
      form.validate().element($(e.target))
}

handlePractitionerFieldChange = ->
  userId = $(this).val()
  if userId
    $.ajax
      type: 'GET'
      url: "/api/users/#{userId}/appointment_types.json"
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        optionsHtml = "<option value=''>Select an appointment type</option>"
        for item in data
          optionsHtml = optionsHtml + "<option value='#{item.id}'>#{item.name}: $#{Number(item.price).toFixed(2)} (#{item.duration}mins)</option"
        appointmentTypeField.html(optionsHtml)
        # appointmentTypeField.removeAttr('disabled')

      failure: (response, statusText, statusMessage) =>
        throw statusMessage
  else
    resetField(appointmentTypeField)
    resetField(dateField)
    resetField(startTimeField)

handleAppointmentFieldChange = ->
  if $(this).val()
    # dateField.removeAttr('disabled')
  else
    resetField(dateField)
    resetField(startTimeField)

handleDateFieldChange = ->
  dateString = $(this).val()
  userId = practitionerField.val()
  appointmentTypeId = appointmentTypeField.val()
  if dateString && userId && appointmentTypeId
    $.ajax
      type: 'GET'
      url: "/api/users/#{userId}/timeslots.json"
      dataType: 'json'
      data:
        date: dateString
        appointment_type_id: appointmentTypeId
      success: (data, textStatus, jqXHR) =>
        optionsHtml = "<option value=''>Select a time</option>"
        for item in data
          date = new Date(Date.parse(item.start_time))
          optionsHtml = optionsHtml + "<option value='#{item.start_time}'>#{formatTime(date)}</option>"
        startTimeField.html(optionsHtml)
        # startTimeField.removeAttr('disabled')

        if data.length
          form.find('.no-appointment-times').hide()
          startTimeField.show()
        else
          form.find('.no-appointment-times').show()
          startTimeField.hide()


      failure: (response, statusText, statusMessage) =>
        throw statusMessage
  else
    resetField(startTimeField)

# handleTimeFieldChange = ->
#   if $(this).val()
#     submitField.removeAttr('disabled').removeClass('disabled')
#   else
#     submitField.attr('disabled', true).addClass('disabled')

resetField = (field) ->
  field.val('').trigger('change')
  # field.attr('disabled', true)

formatTime = (date) ->
  if date.getHours() < 12
    amPm = "AM"
  else
    amPm = "PM"
  "#{leftPad(date.getHours(), 2, '0')}:#{leftPad(date.getMinutes(), 2, '0')} #{amPm}"

leftPad =  (val, size, ch) ->
  result = String(val)
  ch = " " if !ch

  while result.length < size
    result = ch + result

  result

