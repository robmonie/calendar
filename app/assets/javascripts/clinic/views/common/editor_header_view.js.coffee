Calendar.EditorHeaderView = Ember.View.extend
  templateName: "editor_header"
  editorTitle: null
  editorTitleWhenNew: null
  classNames: ['header']

  editorTitleDisplay: (->
    if @get('controller.isNew')
      @get('editorTitleWhenNew') || @get('editorTitle')
    else
      @get('editorTitle')
  ).property('editorTitle', 'controller.isNew')