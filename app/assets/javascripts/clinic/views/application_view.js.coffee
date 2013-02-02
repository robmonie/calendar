Calendar.ApplicationView = Ember.View.extend

  templateName: 'application'
  classNames: ['view-port']

  didInsertElement: ->
    @_manageWindowSize()
    $(window).on 'resize', =>
      @_manageWindowSize()

  _manageWindowSize: ->
    width = $(window).width()
    @$('#header-main-wrapper').css(width: width + 'px')