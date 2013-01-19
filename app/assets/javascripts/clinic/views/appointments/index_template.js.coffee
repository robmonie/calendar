Ember.TEMPLATES['appointments'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.AppointmentsToolbarView}}
    {{view Calendar.AppointmentsListView}}
  </div>
  <div class="mask" {{bindAttr class="editController.isDirty"}}></div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      <div class="unsaved-changes" {{bindAttr class="editController.isDirty"}}><i></i>You have unsaved changes</div>
      {{outlet}}
     </div>
  </div>
"""