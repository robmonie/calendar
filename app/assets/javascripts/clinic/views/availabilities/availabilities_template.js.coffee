Ember.TEMPLATES['availabilities'] = Ember.Handlebars.compile """
  {{view Calendar.EditorHeaderView editorTitle="Availability"}}
  <div class="list-container">
    {{view Calendar.AvailabilitiesToolbarView}}
    {{view Calendar.AvailabilitiesListView}}
  </div>
"""