Ember.TEMPLATES['appointments/edit'] = Ember.Handlebars.compile """
    <ul class="standard-form appointment">
      <li>
        <h2>Appointment</h2>
      </li>
      <li>
        {{view Calendar.Select
          label="Type"
          contentBinding="appointmentTypes"
          optionValuePath="content.id"
          optionLabelPath="content.summary"
          selectionBinding="appointmentType"
          prompt="Adhoc appointment"
          }}
      </li>
      <li>
        {{view Calendar.DateTimeField label="Start at" valueBinding="startTime" required="true"}}
      </li>
      <li>
        {{#if appointmentType}}
          {{view Calendar.DisplayField label="End at" valueBinding="endTime" }}
        {{else}}
          {{view Calendar.DateTimeField label="End at" valueBinding="endTime" required="true"}}
        {{/if}}
      </li>
      <li>
        {{#if overlappingAppointment}}
          <div class="overlapping">This time overlaps another appointment
            {{#if overlappingAppointment.client}}
              with {{overlappingAppointment.client.name}}
            {{/if}}
            between {{date overlappingAppointment.startTime format="hh:mm tt"}} - {{date overlappingAppointment.endTime format="hh:mm tt"}}
          </div>
        {{/if}}
      </li>
      <li>
        {{view Calendar.Select
          label="Client"
          contentBinding="clients"
          optionValuePath="content.id"
          optionLabelPath="content.name"
          selectionBinding="client"
          prompt="Select client"
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