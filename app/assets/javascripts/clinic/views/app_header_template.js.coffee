Ember.TEMPLATES['app_header'] = Ember.Handlebars.compile """
  <button class="nav-toggle" {{action "toggleNavigation"}}>
    <span class="bar"></span>
    <span class="bar"></span>
    <span class="bar"></span>
  </button>
  <div class="app-name">Calendar</div>
"""