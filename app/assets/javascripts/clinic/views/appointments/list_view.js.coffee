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

    today = $('.group[data-days-from-today="0"]')[0]

    if not today
      allDays = $('.group[data-days-from-today]')

      daysAfterToday = _.filter allDays, (el) ->
        Number($(el).data('days-from-today')) > 0

      closestToToday = _.min [null].concat(daysAfterToday), (el) ->
        Number($(el).data('days-from-today'))

    scrollTo = today || closestToToday

    if scrollTo
      if @iScroll
        @iScroll.scrollToElement(scrollTo, 200)
      else
        @$('.scroller').scrollTo(scrollTo, 300)


  #put a binding between the value and the observer to ensure the observer only fires at the end of the event loop
  appointmentsByStartDateBinding: Ember.Binding.oneWay('controller.byStartDate')


  appointmentsDidChange: (->
    if @iScroll
      Ember.run.next =>
        @iScroll.refresh()
  ).observes('appointmentsByStartDate')
