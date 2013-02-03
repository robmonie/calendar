Ember.TEMPLATES['availabilities/edit'] = Ember.Handlebars.compile """
    {{view Calendar.EditorHeaderView editorTitle="Availability"}}
    <ul class="standard-form">
      <li>
        {{view Calendar.Select
          label="Weekday"
          contentBinding="weekdays"
          optionValuePath="content.index"
          optionLabelPath="content.name"
          valueBinding="weekdayIndex"
          prompt="Select weekday"
          required="true"
          }}
      </li>
      <li>
        {{view Calendar.Select
          label="Start hour"
          contentBinding="hours"
          optionValuePath="content.value"
          optionLabelPath="content.label"
          valueBinding="startHour"
          required="true"
          }}
      </li>
      <li>
        {{view Calendar.Select
          label="Start minute"
          contentBinding="minutes"
          optionValuePath="content.value"
          optionLabelPath="content.label"
          valueBinding="startMinute"
          required="true"
          }}
      </li>
      <li>
        {{view Calendar.Select
          label="End hour"
          contentBinding="hours"
          optionValuePath="content.value"
          optionLabelPath="content.label"
          valueBinding="endHour"
          required="true"
          }}
      </li>
      <li>
        {{view Calendar.Select
          label="End minute"
          contentBinding="minutes"
          optionValuePath="content.value"
          optionLabelPath="content.label"
          valueBinding="endMinute"
          required="true"
          }}
      </li>
      <li>
        {{partial "standard_form_actions"}}
      </li>
    </ul>
"""