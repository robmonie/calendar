Calendar.ListScrollerMixin = Ember.Mixin.create

  didInsertElement: ->
    @_super()
    Ember.run.next =>
      scroller = @$('.scroller')
      if Modernizr.touch
        @iScroll = new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')

  willDestroyElement: ->
    @_super()
    @iScroll?.destroy()

  itemsChange: (->
    if @iScroll
      Ember.run.next =>
        @iScroll.refresh()
  ).observes('controller.length')