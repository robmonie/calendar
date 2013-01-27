Calendar.ApplicationController = Ember.Controller.extend

  navigationVisible: false

  toggleNavigation: ->
    @set('navigationVisible', !@get('navigationVisible'))

  currentPathObserver: (->
    @set('navigationVisible', false)
  ).observes('currentPath')