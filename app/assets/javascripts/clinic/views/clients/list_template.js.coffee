Ember.TEMPLATES['clients_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell name">Name</li>
      <li class="cell phone">Phone</li>
      <li class="cell email">Email</li>
    </ul>

    {{view Calendar.UndoDeleteMessageView message="You have just deleted a Client"}}

    <ul class="body">
      {{#each client in controller}}
        <li>
          {{#linkTo 'clients.edit' client}}
            <div class="cell name">{{client.name}}</div>
            <div class="cell phone">{{client.phone}}</div>
            <div class="cell email">{{client.email}}</div>
          {{/linkTo}}
        </li>
      {{else}}
        <li class="empty-message">You have no clients. {{#linkTo 'clients.new'}}Create one.{{/linkTo}}</li>
      {{/each}}
    </ul>
"""