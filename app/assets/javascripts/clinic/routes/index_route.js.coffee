Calendar.IndexRoute = Ember.Route.extend

  redirect: ->
    @transitionTo('appointments')

  events:
    cancelCommit: ->
      @controllerFor('application').cancelCommit()