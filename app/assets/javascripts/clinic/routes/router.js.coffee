Calendar

Calendar.Router.map (match) ->
  # match('/clinic').to 'index', (match) ->
  match('/appointments').to 'appointments', (match) ->
    match('new').to('new')