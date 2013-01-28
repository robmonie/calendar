Ember.TEMPLATES['availabilities_list'] = Ember.Handlebars.compile """

    <ul class="header">
      <li class="cell weekday">Weekday</li>
      <li class="cell start">Start time</li>
      <li class="cell end">End time</li>
    </ul>

    {{view Calendar.UndoDeleteMessageView message="You have just deleted an Availability"}}

    <div class="scroller">
      <ul class="body">
        {{#each availability in controller}}
          <li>
            {{#linkTo 'availabilities.edit' availability}}
              <div class="cell weekday">{{weekday availability.weekdayIndex}}</div>
              <div class="cell start">{{zeroPad availability.startHour length="2"}}:{{zeroPad availability.startMinute length="2"}}</div>
              <div class="cell end">{{zeroPad availability.endHour length="2"}}:{{zeroPad availability.endMinute length="2"}}</div>
            {{/linkTo}}
          </li>
        {{else}}
          {{#unless content.isUpdating}}
            <li class="empty-message">You have no availabilities. {{#linkTo 'availabilities.new'}}Create one.{{/linkTo}}</li>
          {{/unless}}
        {{/each}}
      </ul>
    </div>
"""