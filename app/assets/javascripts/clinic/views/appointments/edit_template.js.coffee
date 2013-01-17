Ember.TEMPLATES['appointment_edit'] = Ember.Handlebars.compile """

  <ul class="standard-form">
    <li>
      <h2>Appointment</h2>
    </li>
    <li>
      <label>Start</label>{{view Calendar.DateTimeField valueBinding="startTime"}}
    </li>
    <li>
      <label>End</label>{{view Calendar.DateTimeField valueBinding="endTime"}}
    </li>
    <li>
      <label>Client</label>{{view Ember.Select
        contentBinding="clients"
        optionValuePath="content.id"
        optionLabelPath="content.name"
        selectionBinding="client"
        prompt="Select client"}}
    </li>
    <li>
      <label>Comments</label>{{view Ember.TextArea valueBinding="comments"}}
    </li>
    <li class="actions">
      <ul>
        <li>
          <button {{action save}} class="primary">Save</button>
        </li>
        <li>
          {{#linkTo 'appointments' class="btn secondary"}}Close{{/linkTo}}
        </li>
      </ul>
    </li>
  </ul>

"""