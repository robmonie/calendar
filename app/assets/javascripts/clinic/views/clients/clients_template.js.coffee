Ember.TEMPLATES['clients'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.ClientsToolbarView}}
    {{view Calendar.ClientsListView}}
  </div>
"""