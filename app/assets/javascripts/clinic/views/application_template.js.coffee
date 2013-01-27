Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
  {{view Calendar.AppHeaderView id="header"}}
  <div id="main">
    {{outlet}}
  </div>
  {{view Calendar.AppNavigationView id="navigation"}}
"""