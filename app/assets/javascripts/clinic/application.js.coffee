window.Calendar = Ember.Application.create
  rootElement: "#viewporter"
  Router: Ember.Router.extend
    rootUrl: '/clinic/'


Calendar.Adapter = DS.RESTAdapter.extend()

Calendar.Adapter.configure("plurals", {
  availability: "availabilities"
})

Calendar.Adapter.configure('Calendar.Appointment', {
  sideloadAs: 'appointments'
})
Calendar.Adapter.configure('Calendar.AppointmentType', {
  sideloadAs: 'appointment_types'
})

Calendar.Adapter.configure('Calendar.Availability', {
  sideloadAs: 'availabilities'
})

Calendar.Adapter.configure('Calendar.Client', {
  sideloadAs: 'clients'
})

Calendar.Adapter.map('Calendar.Client', {
  appointments:
    key: 'appointment_ids'
})

Calendar.store = DS.Store.create
  revision: 12
  adapter: Calendar.Adapter.create
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

$(->
  new FastClick(document.body)
)

# DEV DEBUGGING
# Ember.subscribe "render",
#   before: (name, start, payload) ->
#     start

#   after: (name, end, payload, start) ->
#     duration = Math.round(end - start)
#     template = payload.template
#     console.log "rendered", template, "took", duration, "ms"  if template

