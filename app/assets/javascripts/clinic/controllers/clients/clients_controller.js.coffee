Calendar.ClientsController = Ember.ArrayController.extend

  templateName: 'clients'
  editController: null

  isEditing: (->
    @get('editController') != null
  ).property('editController')