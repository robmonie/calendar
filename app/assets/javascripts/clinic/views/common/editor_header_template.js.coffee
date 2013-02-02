Ember.TEMPLATES['editor_header'] = Ember.Handlebars.compile """
  <h2>{{view.editorTitle}}</h2>
  <div class="unsaved-changes" {{bindAttr class="isDirty"}}><i></i>
    <span>Unsaved</span>
    <button {{action close}} class="close-editor" title="Close"></button>
  </div>
"""