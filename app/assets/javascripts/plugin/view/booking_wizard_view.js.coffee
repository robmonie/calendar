#=require plugin/view/wizard_view
#=require plugin/view/select_appointment_view
#=require plugin/view/client_details_view
#=require plugin/view/confirmation_view
CalendarPlugin.BookingWizardView = CalendarPlugin.WizardView.extend


  numberOfPages:  1
  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  pageViewClasses: [
      CalendarPlugin.SelectAppointmentView
      CalendarPlugin.ClientDetailsView
      CalendarPlugin.ConfirmationView
    ]

  submit: ->
   @getPath('content').submit
    success: =>
      @nextPage()
    failure: =>
      alert('Something went wrong while submitting your booking...')


