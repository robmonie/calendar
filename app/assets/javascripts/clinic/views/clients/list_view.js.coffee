Calendar.ClientsListView = Ember.View.extend

  classNames: ['list', 'clients-list']
  templateName: 'clients_list'

  didInsertElement: ->
    Ember.run.next =>
      scroller = @$('.scroller')
      if Modernizr.touch
        new iScroll(scroller[0])
      else
        scroller.css(overflow: 'scroll')