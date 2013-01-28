Ember.TEMPLATES['appointments_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell start-time">Start</li>
      <li class="cell end-time">End</li>
      <li class="cell client">Client</li>
      <li class="cell comments">Comments</li>
    </ul>

    {{view Calendar.UndoDeleteMessageView message="You have just deleted an Appointment"}}

    <div class="scroller">
      <ul class="body">
        {{#each byStartDate in controller.byStartDate}}

          {{#if byStartDate.isToday}}
            <li class="group is-today">
          {{else}}
            <li class="group">
          {{/if}}
            <div class="group-header">
              <span class="count">{{byStartDate.appointments.length}}</span>
              <span class="title">{{date byStartDate.startDate format="ddd dd/MM/yyyy" }}</span>
            </div>
            <ul class="grouped-items">
              {{#each appointment in byStartDate.appointments}}
                <li>
                  {{#linkTo 'appointments.edit' appointment}}
                    <div class="cell start-time">{{date appointment.startTime format="hh:mm tt"}}</div>
                    <div class="cell end-time">{{date appointment.endTime format="hh:mm tt"}}</div>
                    <div class="cell client">{{appointment.client.name}}</div>
                    <div class="cell comments">{{appointment.comments}}</div>
                  {{/linkTo}}
                </li>
              {{/each}}
            </ul>
          </li>
        {{else}}
          {{#unless content.isUpdating}}
            <li class="empty-message">You have no appointments. {{#linkTo 'appointments.new'}}Create one.{{/linkTo}}</li>
          {{/unless}}
        {{/each}}
      </ul>
    </div>
"""

# {{#each appointment in controller}}
#         <li>
#           {{#linkTo 'appointments.edit' appointment}}
#             <div class="cell start-time">{{date appointment.startTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
#             <div class="cell end-time">{{date appointment.endTime format="ddd dd/MM/yyyy hh:mm tt"}}</div>
#             <div class="cell client">{{appointment.client.name}}</div>
#             <div class="cell comments">{{appointment.comments}}</div>
#           {{/linkTo}}
#         </li>
#       {{else}}
#         {{#unless content.isUpdating}}
#           <li class="empty-message">You have no appointments. {{#linkTo 'appointments.new'}}Create one.{{/linkTo}}</li>
#         {{/unless}}
#       {{/each}}