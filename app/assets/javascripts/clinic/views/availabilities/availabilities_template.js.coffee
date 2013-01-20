Ember.TEMPLATES['availabilities'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.AvailabilitiesToolbarView}}
    {{view Calendar.AvailabilitiesListView}}
  </div>
"""