Ember.TEMPLATES['clients_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell name">Name</li>
      <li class="cell phone">Phone</li>
      <li class="cell email">Email</li>
    </ul>

    <ul class="body">
      {{#each client in controller}}
        <li>
          {{#linkTo 'clients.edit' client}}
            <div class="cell name">{{client.name}}</div>
            <div class="cell phone">{{client.phone}}</div>
            <div class="cell email">{{client.email}}</div>
          {{/linkTo}}
        </li>
      {{/each}}
    </ul>
"""