Calendar.Router.map (match) ->

  match('/appointments').to 'appointments', (match) ->
    match('new').to('new')
    match('/:appointment_id').to('edit')

  match('/appointment_types').to 'appointmentTypes', (match) ->
    match('new').to('new')
    match('/:appointment_type_id').to('edit')

  match('/clients').to 'clients', (match) ->
    match('new').to('new')
    match('/:client_id').to('edit')

  match('/availabilities').to 'availabilities', (match) ->
    match('new').to('new')
    match('/:availability_id').to('edit')