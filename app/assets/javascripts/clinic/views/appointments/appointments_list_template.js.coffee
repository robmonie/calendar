Ember.TEMPLATES['appointments_list'] = Ember.Handlebars.compile """
  <ul class="unstyled">
    {{#each controller}}
      <li>
        <div class="cell date">{{date startTime format="ddd dd/MM/yyyy"}}</div>
        <div class="cell start-time">{{date startTime format="hh:mm tt"}}</div>
        <div class="cell end-time">{{date endTime format="hh:mm tt"}}</div>
        <div class="cell client">{{client.name}}</div>
      </li>
    {{/each}}
  </ul>
"""