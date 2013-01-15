Ember.TEMPLATES['appointments'] = Ember.Handlebars.compile """
  <div class="table-view-container">
    {{view Calendar.AppointmentsToolbarView}}
    {{view Calendar.AppointmentsTableView}}
  </div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      {{outlet}}
    </div>
  </div>
"""