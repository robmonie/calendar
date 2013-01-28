Calendar.AvailabilitiesListView = Ember.View.extend

  classNames: ['list', 'availabilities-list']
  templateName: 'availabilities_list'

  didInsertElement: ->
    Ember.run.next =>
      scroller = @$('.scroller')
      if Modernizr.touch
        new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')