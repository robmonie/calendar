#= require plugin/model/booking

CalendarPlugin.BookingController = SC.Object.extend
  booking: CalendarPlugin.Booking.create()
  businessId: null
  isLoadingUsersBinding: Ember.Binding.oneWay('users.status').transform (status) -> status == "loading"
  users: []
  timeslots: []
  appointmentTypes: []

  currentWizardPage: 1
  numberOfWizardPages: 2

  isCurrentWizardPageValid: (->
    return switch @get('currentWizardPage')
      when 1 then @get('isFirstPageValid')
      when 2 then @get('isSecondPageValid')
      else false
  ).property 'currentWizardPage', 'isFirstPageValid', 'isSecondPageValid'

  isFirstPageValid: (->
    @getPath('booking.user')? and @getPath('booking.appointmentType')? and @getPath('booking.date')? and @getPath('booking.timeslot')?
  ).property 'booking.user', 'booking.appointmentType', 'booking.date', 'booking.timeslot'

  isSecondPageValid: (->

  ).property()

  init: ->
    @_super()
    @_loadUsers()

  dates: (->
    dates = []
    today = CalendarPlugin.date.today()
    dates.pushObject {date: CalendarPlugin.date.formatForServer(today), label: "Today"}
    tomorrow = CalendarPlugin.date.addDays(today, 1)
    dates.pushObject {date: CalendarPlugin.date.formatForServer(tomorrow), label: "Tomorrow"}
    [2..14].forEach ((value) ->
      date = CalendarPlugin.date.addDays(today, value)
      dates.pushObject {date: CalendarPlugin.date.formatForServer(date), label: CalendarPlugin.date.formatForUser(date)}
    )
    dates

  ).property().cacheable()

  _loadUsers: (->
    users = CalendarPlugin.User.findAllByBusiness(@get('businessId'))
    @set 'users', users
  ).observes('businessId')

  _loadAppointmentTypes: (->
    appointmentTypes = CalendarPlugin.AppointmentType.findAllForUser(@getPath 'booking.user', @get('appointmentTypes'))
    @set 'appointmentTypes', appointmentTypes
  ).observes('booking.user')


  _loadTimeslotsForUserAndDate: (->
    user = @getPath 'booking.user'
    dateString = @getPath 'booking.date.date'
    duration = @getPath 'booking.appointmentType.duration'
    if user and dateString and duration
      timeslots = CalendarPlugin.Timeslot.findAllForUserAndDate(user, new Date(Date.parse(dateString)), duration)
    else
      timeslots = []

    @set 'timeslots', timeslots

  ).observes('booking.user', 'booking.date', 'booking.duration')

