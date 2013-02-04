Calendar.ClientsEditControllerMixin = Ember.Mixin.create

  needs: ['clients']

  indexRoute: 'clients'

  getIndexController: ->
    @get('controllers.clients')
