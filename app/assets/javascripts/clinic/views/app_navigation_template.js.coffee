Ember.TEMPLATES['app_navigation'] = Ember.Handlebars.compile """
  <button class="nav-toggle" {{action "toggleNavigation"}}>
    <span class="bar"></span>
    <span class="bar"></span>
    <span class="bar"></span>
  </button>
  <ul class="unstyled">
    <li>{{#linkTo "appointments"}}Appointments{{/linkTo}}</li>
    <li>{{#linkTo "clients"}}Clients{{/linkTo}}</li>
    <li><h2>Preferences</h2></li>
    <li>{{#linkTo "appointmentTypes"}}Appointment types{{/linkTo}}</li>
    <li>{{#linkTo "availabilities"}}Availability{{/linkTo}}</li>
  </ul>
"""