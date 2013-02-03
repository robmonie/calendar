Calendar.IndexRoute = Ember.Route.extend

  redirect: ->
    @transitionTo('appointments')

  events:
    cancelCommit: ->
      console.log 'cancel commit'
      @controllerFor('application').cancelCommit()