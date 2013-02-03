Calendar.ClientsController = Ember.ArrayController.extend

  templateName: 'clients'
  editController: null
  sortProperties: ['name']

  isEditing: (->
    @get('editController') != null
  ).property('editController')
