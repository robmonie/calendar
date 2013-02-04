Ember.TEMPLATES['appointments/edit'] = Ember.Handlebars.compile """
    {{view Calendar.EditorHeaderView editorTitle="Appointment"}}
    <ul class="standard-form appointment">
      <li>
        {{view Calendar.Select
          label="Type"
          contentBinding="appointmentTypes"
          optionValuePath="content.id"
          optionLabelPath="content.summary"
          selectionBinding="appointmentType"
          prompt="Adhoc calendar event"
          }}
      </li>
      <li>
        {{view Calendar.DateTimeField label="Start at" valueBinding="startTime" required=true}}
      </li>
      <li>
        {{#if appointmentType}}
          {{view Calendar.DateTimeField label="End at" valueBinding="endTime" required=true}}
        {{else}}
          {{view Calendar.DateTimeField label="End at" valueBinding="endTime" required=true}}
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
      {{#if client}}
        <li>
          {{view Calendar.TextField label="Client Name" valueBinding="client.name" required="true"}}
        </li>
        <li>
          {{view Calendar.TextField label="Client Phone" valueBinding="client.phone" required="true" class="phone"}}
        </li>
        <li>
          {{view Calendar.TextField label="Client Email" valueBinding="client.email" validators="email"}}
        </li>
      {{/if}}
      <li>
        <label>Comments</label>{{view Ember.TextArea valueBinding="comments"}}
      </li>
      <li>
        {{partial "standard_form_actions"}}
      </li>
    </ul>
"""