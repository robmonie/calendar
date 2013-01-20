Ember.TEMPLATES['index_layout'] = Ember.Handlebars.compile """
  {{yield}}
  <div class="mask" {{bindAttr class="editController.isDirty"}}></div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      <div class="unsaved-changes" {{bindAttr class="editController.isDirty"}}><i></i>You have unsaved changes</div>
      {{outlet}}
     </div>
  </div>
"""