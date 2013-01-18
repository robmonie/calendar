Ember.TEMPLATES['appointment_type_edit'] = Ember.Handlebars.compile """

  <ul class="standard-form">
    <li><h2>Appointment Type</h2></li>
    <li>
      <label>Name</label>{{view Ember.TextField valueBinding="name"}}
    </li>
     <li>
      <label>Description</label>{{view Ember.TextArea valueBinding="description"}}
    </li>
     <li>
      <label>Duration</label>{{view Ember.TextField valueBinding="duration" class="number"}}<span class="add-on">mins</span>
    </li>
     <li>
      <label>Price ($)</label>{{view Ember.TextField valueBinding="price" class="price"}}
    </li>
    <li class="actions">
      <ul>
        <li>
          <button {{action save}} class="primary">Save</button>
        </li>
        <li>
          <button {{action close}} class="secondary">Close</button>
        </li>
      </ul>
    </li>
  </ul>

"""