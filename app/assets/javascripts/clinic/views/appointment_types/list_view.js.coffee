Calendar.AppointmentTypesListView = Ember.View.extend

  classNames: ['list', 'appointment-types-list']
  templateName: 'appointment_types_list'

  didInsertElement: ->
    Ember.run.next =>
      scroller = @$('.scroller')
      if Modernizr.touch
        new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')


