Ember.TEMPLATES['clients/edit'] = Ember.Handlebars.compile """
    <button {{action close}} class="close-phone secondary" >Close</button>
    <ul class="standard-form">
      <li>
        <h2>Client</h2>
      </li>
      <li>
        {{view Calendar.TextField label="Name" valueBinding="name" required="true" autoFocus="true"}}
      </li>
      <li>
        {{view Calendar.TextField label="Phone" valueBinding="phone" required="true" class="phone"}}
      </li>
      <li>
        {{view Calendar.TextField label="Email" valueBinding="email" validators="email"}}
      </li>
      <li>
        {{partial "standard_form_actions"}}
      </li>
    </ul>
"""