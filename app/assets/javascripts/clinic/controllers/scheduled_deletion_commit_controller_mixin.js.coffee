Calendar.ScheduledDeletionCommitControllerMixin = Ember.Mixin.create

  deletionCommitScheduled: false
  commitLaterFn: null

  commitObserver: (->
    if @get('deletionCommitScheduled')

      commitLaterFn = Ember.run.later(@, ->
        console.log 'committing'
        Calendar.store.commit()
        @set('commitLaterFn', null)
        @set('deletionCommitScheduled', false)
      , 8000)

      @set('commitLaterFn', commitLaterFn)

    else if @get('commitLaterFn') # if we have a function scheduled
      console.log 'cancel'
      Ember.run.cancel(@get('commitLaterFn'))
      @set('commitLaterFn', null)
      Calendar.store.defaultTransaction.rollback() #What if another has been started since then ?

  ).observes('deletionCommitScheduled')

  cancelCommit: ->
    @set('deletionCommitScheduled', false)
