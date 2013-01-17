Ember.TEMPLATES['appointment_types/new'] = Ember.Handlebars.compile """

  <ul class="standard-form">
    <li><h2>New Appointment Type</h2></li>
    <li>
      <label>Name</label>{{view Ember.TextField valueBinding="name"}}
    </li>
     <li>
      <label>Description</label>{{view Ember.TextField valueBinding="description"}}
    </li>
     <li>
      <label>Duration</label>{{view Ember.TextField valueBinding="duration"}}
    </li>
     <li>
      <label>Price</label>{{view Ember.TextField valueBinding="price"}}
    </li>
    <li class="actions">
      <ul>
        <li>
          <button {{action save}} class="primary">Save</button>
        </li>
        <li>
          {{#linkTo 'appointmentTypes' class="btn secondary"}}Close{{/linkTo}}
        </li>
      </ul>
    </li>
  </ul>

"""