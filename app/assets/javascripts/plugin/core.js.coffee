window.CalendarPlugin = Ember.Application.create
  NAMESPACE: 'Calendar'
  VERSION:   '0.1.0'

  main: (config = {}) ->
    Ember.run =>
      CalendarPlugin.bookingController = CalendarPlugin.BookingController.create
        businessId: config.businessId

      CalendarPlugin.BookingWizardView.create().append(config.rootElement || $('body'))

