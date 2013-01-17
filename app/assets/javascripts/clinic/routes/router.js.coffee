Calendar.Router.map (match) ->

  match('/appointments').to 'appointments', (match) ->
    match('new').to('new')
    match('/:appointment_id').to('edit')

  match('/appointment_types').to 'appointmentTypes', (match) ->
    match('new').to('new')