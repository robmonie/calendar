Calendar.IndexRoute = Ember.Route.extend

  redirect: ->
    @transitionTo('appointments')