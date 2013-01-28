Calendar.AppointmentsListView = Ember.View.extend

  classNames: ['list', 'appointments-list']
  templateName: 'appointments_list'


  didInsertElement: ->
    Calendar.mediator.on 'showToday', @, @showToday
    Ember.run.later =>
      scroller = @$('.scroller')
      if Modernizr.touch
        new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')
      #
      @showToday()
    , 200

  willDestroyElement: ->
    Calendar.mediator.off 'showToday', @, @showToday

  showToday: ->
    @$('.body').scrollTo(@$('.group.is-today'), 300)
