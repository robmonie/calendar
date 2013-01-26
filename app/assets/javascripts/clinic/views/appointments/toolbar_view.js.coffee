#= require clinic/views/common/toolbar_view
Calendar.AppointmentsToolbarView = Calendar.ToolbarView.extend

  items: [
    { label: 'New Appointment', linkTo: 'appointments.new' }
    { label: 'Show Today', action: 'showToday' }
  ]
