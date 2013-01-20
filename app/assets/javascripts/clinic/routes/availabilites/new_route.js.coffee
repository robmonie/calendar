#= require ../edit_route_mixin
Calendar.AvailabilitiesNewRoute = Ember.Route.extend Calendar.EditRouteMixin,

  indexRoute: 'availabilities'

  model: ->
    Calendar.Availability.createRecord(@_calculateDefaultAttributes())

  #This may not work once we swap to the REST Adapter
  _calculateDefaultAttributes: ->
    # availabilities = Calendar.Availability.find()
    # last = availabilities.objectAt(availabilities.get('length') - 1)
    # if last
    #   index = last.get('weekdayIndex') + 1
    #   if index > 6
    #     index = null

    #   { weekdayIndex: index, startHour: last.get('startHour'), startMinute: last.get('startMinute'), endHour: last.get('endHour'), endMinute: last.get('endMinute') }
    # else
    { weekdayIndex: 1, startHour: 9, startMinute: 0, endHour: 17, endMinute: 0 }