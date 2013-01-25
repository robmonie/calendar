Ember.TEMPLATES['appointment_types_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell name">Name</li>
      <li class="cell duration">Duration (mins)</li>
      <li class="cell price">Price</li>
    </ul>

    {{view Calendar.UndoDeleteMessageView message="You have just deleted an Appointment Type"}}

    <ul class="body">
      {{#each appointmentType in controller}}
        <li>
          {{#linkTo 'appointmentTypes.edit' appointmentType}}
            <div class="cell name">{{appointmentType.name}}</div>
            <div class="cell duration">{{appointmentType.duration}}</div>
            <div class="cell price">{{appointmentType.price}}</div>
          {{/linkTo}}
        </li>
      {{else}}
        {{#unless content.isUpdating}}
          <li class="empty-message">You have no appointment types defined. {{#linkTo 'appointmentTypes.new'}}Create one.{{/linkTo}}</li>
        {{/unless}}
      {{/each}}
    </ul>
"""