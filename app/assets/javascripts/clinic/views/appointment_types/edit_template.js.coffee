Ember.TEMPLATES['appointment_type_edit'] = Ember.Handlebars.compile """

    <ul class="standard-form">
      <li><h2>Appointment Type</h2></li>
      <li>
        {{view Calendar.TextField valueBinding="name" label="Name" hint="Clients will see this name online" required="true"}}
      </li>
       <li>
        {{view Calendar.TextArea label="Description" valueBinding="description" required="true"}}
      </li>
       <li>
        {{view Calendar.TextField label="Duration" valueBinding="duration" required="true" hint="In minutes" class="number"}}
      </li>
      <li>
        {{view Calendar.TextField label="Price ($)" valueBinding="price" required="true" class="price"}}
      </li>
      <li>
        {{view Calendar.StandardFormActions}}
      </li>
    </ul>

"""