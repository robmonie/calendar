Ember.TEMPLATES['clients/edit'] = Ember.Handlebars.compile """
  <div id="client-editor">
    {{view Calendar.EditorHeaderView editorTitleBinding="name" editorTitleWhenNew="New Client"}}
    {{#unless isNew}}
      <div class="summary">
        <img {{bindAttr src="gravatarImageUrl"}} class="avatar"/>
        <div class="details">
          <p>
            {{#if nextAppointment}}
              Next appointment: {{#linkTo "appointments.edit" nextAppointment}}{{date nextAppointment.startTime format="ddd dd/MM/yyyy hh:mm tt"}}{{/linkTo}}
            {{else}}
              No appointments scheduled
            {{/if}}
          </p>
          <p>Total appointments: {{appointments.length}}</p>

        </div>
      </div>
    {{/unless}}
    {{#if isNew}}
      <ul class="standard-form">
    {{else}}
      <ul class="standard-form has-summary">
    {{/if}}

      <li>
        {{view Calendar.TextField label="Name" valueBinding="name" required="true" autoFocus="true"}}
      </li>
      <li>
        {{view Calendar.TextField label="Phone" valueBinding="phone" required="true" class="phone" type="tel"}}
      </li>
      <li>
        {{view Calendar.TextField label="Email" valueBinding="email" validators="email" type="email"}}
      </li>
      <li>
        {{partial "standard_form_actions"}}
      </li>
    </ul>
  </div>
"""