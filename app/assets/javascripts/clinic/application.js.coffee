window.Calendar = Ember.Application.create

  Router: Ember.Router.extend
    rootUrl: '/clinic/'
    # location: 'history'

Calendar.store = DS.Store.create
  revision: 11
  adapter: DS.LSAdapter.create
    namespace: 'calendar'

