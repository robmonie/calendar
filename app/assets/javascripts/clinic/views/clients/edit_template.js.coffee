Ember.TEMPLATES['clients/edit'] = Ember.Handlebars.compile """
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
        {{view Calendar.TextField label="Email" valueBinding="email"}}
      </li>
      <li>
        {{view Calendar.StandardFormActions}}
      </li>
    </ul>
"""