CalendarPlugin.ClientDetailsView = Ember.View.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/client_details"

  isVisible: (->
    CalendarPlugin.bookingController.get('currentWizardPage') == 2
  ).property('CalendarPlugin.bookingController.currentWizardPage')

  # formattedAppointmentDateBinding: Em.Binding.oneWay('content.booking.date.d').transform (date) ->
  #   console.log date
  #   CalendarPlugin.date.formatForUser(date) if date



