Ember.TEMPLATES['index_layout'] = Ember.Handlebars.compile """
  {{yield}}
  <div class="mask" {{bindAttr class="editController.isDirty"}}></div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    {{outlet}}
  </div>
"""