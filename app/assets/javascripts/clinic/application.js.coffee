window.Calendar = Ember.Application.create

  Router: Ember.Router.extend
    rootUrl: '/clinic/'
    # location: 'history'

DS.RESTAdapter.configure("plurals", {
  availability: "availabilities"
})

DS.RESTAdapter.configure('Calendar.Appointment', {
  sideloadAs: 'appointments'
})
DS.RESTAdapter.configure('Calendar.AppointmentType', {
  sideloadAs: 'appointment_types'
})

DS.RESTAdapter.configure('Calendar.Availability', {
  sideloadAs: 'availabilities'
})

DS.RESTAdapter.configure('Calendar.Client', {
  sideloadAs: 'clients'
})


Calendar.store = DS.Store.create
  revision: 11
  adapter: DS.RESTAdapter.create
    namespace: 'api'

Calendar.mediator = Ember.Object.createWithMixins(Ember.Evented)


# Calendar.set('timezone', '+1200')
Calendar.DATE_FORMAT = 'dd/mm/yy'
Calendar.TIME_FORMAT = 'hh:mmtt'
Calendar.DATE_TIME_FORMAT = "#{Calendar.DATE_FORMAT} #{Calendar.TIME_FORMAT}"

Calendar.WEEK_DAYS = [
    {name: 'Sunday', index: 0}
    {name: 'Monday', index: 1}
    {name: 'Tuesday', index: 2}
    {name: 'Wednesday', index: 3}
    {name: 'Thursday', index: 4}
    {name: 'Friday', index: 5}
    {name: 'Saturday', index: 6}
  ]
