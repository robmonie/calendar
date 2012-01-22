#= require plugin/model/booking

CalendarPlugin.BookingController = SC.Object.extend
  booking: CalendarPlugin.Booking.create()
  businessId: null
  isLoadingPractitionersBinding: Ember.Binding.oneWay('pracitioners.status').transform (status) -> status == "loading"
  practitioners: []

  init: ->
    @_super()
    @_loadPractitioners()

  _loadPractitioners: (->
    practitioners = CalendarPlugin.Practitioner.findAllByBusiness(@get('businessId'))
    @set 'practitioners', practitioners
  ).observes('businessId')