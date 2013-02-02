#= require ../common/list_scroller_mixin
Calendar.ClientsListView = Ember.View.extend Calendar.ListScrollerMixin,

  classNames: ['list', 'clients-list']
  templateName: 'clients_list'

  didInsertElement: ->
    Ember.run.next =>
      @_manageScrolling()

  _manageScrolling: ->
    scroller = @$('.scroller')
    if Modernizr.touch
      new iScroll(scroller[0])
    else
      scroller.css(overflow: 'scroll')
