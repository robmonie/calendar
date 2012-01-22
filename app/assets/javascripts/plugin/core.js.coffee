window.CalendarPlugin = Ember.Application.create
  NAMESPACE: 'Calendar'
  VERSION:   '0.1.0'

  main: (config = {rootElement: $("body")}) ->
    CalendarPlugin.bookingController = CalendarPlugin.BookingController.create
      businessId: config.businessId

    CalendarPlugin.PluginContainerView.create().append(config.rootElement)

