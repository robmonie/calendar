Ember.TEMPLATES['appointment_types_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell name">Name</li>
      <li class="cell duration">Duration (mins)</li>
      <li class="cell price">Price</li>
    </ul>

    <ul class="body">
      {{#each controller}}
        <li>
          <div class="cell name">{{name}}</div>
          <div class="cell duration">{{duration}}</div>
          <div class="cell price">{{price}}</div>
        </li>
      {{/each}}
    </ul>
"""