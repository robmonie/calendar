Ember.TEMPLATES['appointment_types'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.AppointmentTypesToolbarView}}
    {{view Calendar.AppointmentTypesListView}}
  </div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      {{outlet}}
    </div>
  </div>
"""