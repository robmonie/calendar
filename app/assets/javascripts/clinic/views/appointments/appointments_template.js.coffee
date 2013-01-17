Ember.TEMPLATES['appointments'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.AppointmentsToolbarView}}
    {{view Calendar.AppointmentsListView}}
  </div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      {{outlet}}
    </div>
  </div>
"""