CalendarPlugin.WizardPageView = Ember.View.extend

  isVisible: false

  init: ->
    @_super()
    @set('validationGroup', CalendarPlugin.ValidationGroup.create())

  isValidDidChange: ((s,k,v)->
    @setPath('parentView.parentView.isCurrentPageValid', v)
  ).observes 'validationGroup.isValid'