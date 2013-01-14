Calendar.ToolbarView = Ember.View.extend

  tagName: 'ul'
  classNames: ['toolbar', 'horizontal']
  templateName: 'toolbar'
  items: [] #subclasses should define items with 'label': 'action/linkTo'