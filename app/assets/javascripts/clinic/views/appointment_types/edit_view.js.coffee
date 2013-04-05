#= require clinic/validation/validation_group_mixin
Calendar.AppointmentTypesEditView = Ember.View.extend Calendar.ValidationGroupMixin,
  templateName: 'appointment_types/edit'
  classNames: ['editor-content']