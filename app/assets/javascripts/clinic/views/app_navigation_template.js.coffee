Ember.TEMPLATES['app_navigation'] = Ember.Handlebars.compile """
  <button class="nav-toggle" {{action "toggleNavigation"}}>
    <span class="bar"></span>
    <span class="bar"></span>
    <span class="bar"></span>
  </button>
  <ul class="unstyled">
    <li class="appointments">{{#linkTo "appointments"}}<i></i>Appointments{{/linkTo}}</li>
    <li class="clients">{{#linkTo "clients"}}<i></i>Clients{{/linkTo}}</li>
    <li class="preferences"><h2><i></i>Preferences</h2></li>
    <li class="sub">{{#linkTo "appointmentTypes"}}- Appointment types{{/linkTo}}</li>
    <li class="sub">{{#linkTo "availabilities"}}- Availability{{/linkTo}}</li>
  </ul>
"""