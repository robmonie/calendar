Ember.TEMPLATES['appointments_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell start-time">Start</li>
      <li class="cell end-time">End</li>
      <li class="cell client">Client</li>
      <li class="cell comments">Comments</li>
    </ul>

    <ul class="body">
      {{#each appointment in controller}}
        <li>
          {{#linkTo 'appointments.edit' appointment}}
            <div class="cell start-time">{{date appointment.startTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
            <div class="cell end-time">{{date appointment.endTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
            <div class="cell client">{{appointment.client.name}}</div>
            <div class="cell comments">{{appointment.comments}}</div>
          {{/linkTo}}
        </li>
      {{/each}}
    </ul>
"""