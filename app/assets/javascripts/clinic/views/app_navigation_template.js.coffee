Ember.TEMPLATES['app_navigation'] = Ember.Handlebars.compile """
  <ul class="unstyled">
    <li class="appointments">{{#linkTo "appointments"}}<i></i>Appointments{{/linkTo}}</li>
    <li class="clients">{{#linkTo "clients"}}<i></i>Clients{{/linkTo}}</li>
    <li class="preferences"><h2><i></i>Preferences</h2></li>
    <li class="sub appointment-types">{{#linkTo "appointmentTypes"}}- Appointment types{{/linkTo}}</li>
    <li class="sub availabilities">{{#linkTo "availabilities"}}- Availability{{/linkTo}}</li>
  </ul>
"""