Calendar.Router.map ->

  @resource 'appointments', { path: '/appointments'}, ->
    @route 'new'
    @route 'edit', { path: "/:appointment_id" }


  @resource 'appointmentTypes', { path: '/appointment_types'}, ->
    @route 'new'
    @route 'edit', { path: "/:appointment_type_id" }

  @resource 'clients', { path: '/clients'}, ->
    @route 'new'
    @route 'edit', { path: "/:client_id" }

  @resource 'availabilities', { path: '/availabilities'}, ->
    @route 'new'
    @route 'edit', { path: "/:availability_id" }

