Calendar.AppointmentsListView = Ember.View.extend

  classNames: ['list', 'appointments-list']
  templateName: 'appointments_list'


  didInsertElement: ->
    Calendar.mediator.on 'showToday', @, @showToday
    Ember.run.later =>
      scroller = @$('.scroller')
      if Modernizr.touch
        @iScroll = new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')
      @showToday()
    , 200

  willDestroyElement: ->
    Calendar.mediator.off 'showToday', @, @showToday
    @iScroll?.destroy()

  showToday: ->
    if @iScroll
      @iScroll.scrollToElement('.group.is-today', 200)
    else
      todayEl = @$('.group.is-today')
      @$('.body').scrollTo(todayEl, 300) if todayEl.length


  #put a binding between the value and the observer to ensure the observer only fires at the end of the event loop
  appointmentsByStartDateBinding: Ember.Binding.oneWay('controller.byStartDate')


  appointmentsDidChange: (->
    if @iScroll
      Ember.run.next =>
        @iScroll.refresh()
  ).observes('appointmentsByStartDate')
