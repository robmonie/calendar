Ember.TEMPLATES['appointments_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell start-time">Start</li>
      <li class="cell end-time">End</li>
      <li class="cell client">Client</li>
    </ul>

    <ul class="body">
      {{#each controller}}
        <li>
          <div class="cell start-time">{{date startTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
          <div class="cell end-time">{{date endTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
          <div class="cell client">{{client.name}}</div>
        </li>
      {{/each}}
    </ul>
"""