window.Calendar = Ember.Application.create

  Router: Ember.Router.extend
    rootUrl: '/clinic/'
    # location: 'history'

Calendar.store = DS.Store.create
  revision: 11
  adapter: DS.LSAdapter.create
    namespace: 'calendar'


# Calendar.set('timezone', '+1200')
Calendar.DATE_FORMAT = 'dd/mm/yy'
Calendar.TIME_FORMAT = 'hh:mmtt'
Calendar.DATE_TIME_FORMAT = "#{Calendar.DATE_FORMAT} #{Calendar.TIME_FORMAT}"
