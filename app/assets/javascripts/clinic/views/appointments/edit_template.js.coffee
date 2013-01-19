Ember.TEMPLATES['appointment_edit'] = Ember.Handlebars.compile """
    <ul class="standard-form">
      <li>
        <h2>Appointment</h2>
      </li>
      <li>
        {{view Calendar.DateTimeField label="Start Date/Time" valueBinding="startTime" required="true"}}
      </li>
      <li>
        {{view Calendar.DateTimeField label="End Date/Time" valueBinding="endTime" required="true"}}
      </li>
      <li>
        {{view Calendar.Select
          label="Client"
          contentBinding="clients"
          optionValuePath="content.id"
          optionLabelPath="content.name"
          selectionBinding="client"
          prompt="Select client"
          required="true"
          }}
      </li>
      <li>
        <label>Comments</label>{{view Ember.TextArea valueBinding="comments"}}
      </li>
      <li>
        {{view Calendar.StandardFormActions}}
      </li>
    </ul>
"""