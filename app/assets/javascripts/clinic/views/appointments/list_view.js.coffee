Calendar.AppointmentsListView = Ember.View.extend

  classNames: ['list', 'appointments-list']
  templateName: 'appointments_list'


  didInsertElement: ->
    Calendar.mediator.on 'showToday', @, @showToday
    Ember.run.later =>
      @showToday()
    , 200

  willDestroyElement: ->
    Calendar.mediator.off 'showToday', @, @showToday

  showToday: ->
    @$('.body').scrollTo(@$('.group.is-today'), 300)
