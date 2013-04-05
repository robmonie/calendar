#=require ./view_model

class ViewModel.AppNavigation extends ViewModel.Base

  selector: "#navigation"

  showAppointments: ->
    @click('.appointments a')

  showClients: ->
    @click('.clients a')

  showAppointmentTypes: ->
    @click('.appointment-types a')

  showAvailabilities: ->
    @click('.availabilities a')


