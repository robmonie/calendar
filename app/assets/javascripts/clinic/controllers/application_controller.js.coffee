Calendar.ApplicationController = Ember.Controller.extend

  navigationVisible: false

  scheduledTransaction: null
  commitLaterFn: null
  delay: 6000

  scheduleCommitOnTransaction: (transaction) ->
    @set('scheduledTransaction', transaction)

  isTransactionCommitScheduled: (->
    !!@get('scheduledTransaction')
  ).property('scheduledTransaction')

  commitObserver: (->

    scheduledTransaction = @get('scheduledTransaction')

    if scheduledTransaction

      commitLaterFn = Ember.run.later(@, ->
        scheduledTransaction.commit()
        @set('commitLaterFn', null)
        @set('scheduledTransaction', null)
      , @get('delay'))

      @set('commitLaterFn', commitLaterFn)

  ).observes('scheduledTransaction')

  cancelCommit: ->

    commitLaterFn = @get('commitLaterFn')
    transaction = @get('scheduledTransaction')

    if commitLaterFn # if we have a function scheduled
      Ember.run.cancel(commitLaterFn)
      @set('commitLaterFn', null)

    if transaction
      transaction.rollback()
      @set('scheduledTransaction', null)

  toggleNavigation: ->
    @set('navigationVisible', !@get('navigationVisible'))

  currentPathDidChange: (->
    @set('navigationVisible', false)
  ).observes('currentPath')
