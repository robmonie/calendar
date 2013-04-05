Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
  {{view Calendar.UndoDeleteMessageView }}
  {{view Calendar.AppNavigationView id="navigation"}}
  <div id="header-main-wrapper" {{bindAttr class="navigationVisible"}}>
    {{view Calendar.AppHeaderView id="header"}}
    <div id="main">
      {{outlet}}
    </div>
  </div>
"""