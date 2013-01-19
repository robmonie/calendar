Ember.TEMPLATES['appointments'] = Ember.Handlebars.compile """
  <div class="list-container">
    {{view Calendar.AppointmentsToolbarView}}
    {{view Calendar.AppointmentsListView}}
  </div>
  {{outlet}}
"""