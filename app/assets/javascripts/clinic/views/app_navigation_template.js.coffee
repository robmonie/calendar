Ember.TEMPLATES['app_navigation'] = Ember.Handlebars.compile """
  <ul class="unstyled">
    <li>{{#linkTo "appointments"}}Appointments{{/linkTo}}</li>
    <li>{{#linkTo "clients"}}Clients{{/linkTo}}</li>
    <li><h2>Preferences</h2></li>
    <li>{{#linkTo "appointmentTypes"}}Appointment types{{/linkTo}}</li>
    <li>{{#linkTo "availabilities"}}Availability{{/linkTo}}</li>
  </ul>
"""