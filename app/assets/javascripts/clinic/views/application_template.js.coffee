Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
  {{view Calendar.AppHeaderView id="header"}}
  {{view Calendar.AppNavigationView id="navigation"}}
  <div id="main">
    {{outlet}}
  </div>
"""