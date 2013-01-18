Ember.TEMPLATES['appointment_types_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell name">Name</li>
      <li class="cell duration">Duration (mins)</li>
      <li class="cell price">Price</li>
    </ul>

    <ul class="body">
      {{#each appointmentType in controller}}
        <li>
          {{#linkTo 'appointmentTypes.edit' appointmentType}}
            <div class="cell name">{{appointmentType.name}}</div>
            <div class="cell duration">{{appointmentType.duration}}</div>
            <div class="cell price">{{appointmentType.price}}</div>
          {{/linkTo}}
        </li>
      {{/each}}
    </ul>
"""