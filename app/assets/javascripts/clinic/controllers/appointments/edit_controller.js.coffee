#= require ../edit_controller_mixin
#= require ./edit_controller_mixin
Calendar.AppointmentsEditController = Ember.ObjectController.extend Calendar.EditControllerMixin, Calendar.AppointmentsEditControllerMixin,

  isDirty: (->
    @get('content.isDirty') || @get('content.client.isDirty')
  ).property('content.isDirty', 'content.client.isDirty')

