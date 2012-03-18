#= require plugin/model/booking

EMAIL_REGEXP = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/

CalendarPlugin.BookingController = SC.Object.extend
  booking:    null
  businessId: null
  isLoadingUsersBinding: Ember.Binding.oneWay('users.status').transform (status) -> status == "loading"
  users: []
  timeslots: []
  appointmentTypes: []

  # currentWizardPage: 1
  # numberOfWizardPages: 3

  # isCurrentWizardPageValid: (->
  #   return switch @get('currentWizardPage')
  #     when 1 then @get('isFirstPageValid')
  #     when 2 then @get('isSecondPageValid')
  #     else false
  # ).property('currentWizardPage', 'isFirstPageValid', 'isSecondPageValid').cacheable()

  # isFirstPageValid: (->
  #   @getPath('booking.user')? and @getPath('booking.appointmentType')? and @getPath('booking.date')? and @getPath('booking.timeslot')?
  # ).property('booking.user', 'booking.appointmentType', 'booking.date', 'booking.timeslot').cacheable()

  # # isFirstPageValid: (->
  # #   errorKeys = @get('booking.errors.errorKeys')
  # #   [].concat(errorKeys).remove(['user', 'appointmentType', 'timeslot']).length == errorKeys.length
  # # ).property('booking.errors.errorKeys.@each')

  # isSecondPageValid: (->
  #   @getPath('booking.clientEmail')? and @getPath('booking.clientName')? and @getPath('booking.clientPhone')? and @getPath('booking.clientEmail').match(EMAIL_REGEXP)
  # ).property('booking.clientEmail', 'booking.clientName', 'booking.clientPhone').cacheable()

  submit: (success, failure)->
    $.ajax({
      type: "POST"
      url: "/api/users/#{@getPath('booking.user.id')}/appointments",
      data: @get('booking').formData()
    }).done (data) =>
      if data.success
        success()
      else
        failure()



  init: ->
    @_super()
    booking = CalendarPlugin.Booking.create({businessId: @get('businessId')})
    @set('booking', booking)
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

