Ember.TEMPLATES['appointment_edit'] = Ember.Handlebars.compile """
  <div class="mask" {{bindAttr class="isDirty"}}></div>
  <div id="editor" {{bindAttr class="isEditing"}}>
    <div class="pad">
      <div class="unsaved-changes" {{bindAttr class="isDirty"}}><i></i>You have unsaved changes</div>
      <ul class="standard-form">
        <li>
          <h2>Appointment</h2>
        </li>
        <li>
          {{view Calendar.DateTimeField label="Start Date/Time" valueBinding="startTime" required="true"}}
        </li>
        <li>
          {{view Calendar.DateTimeField label="End Date/Time" valueBinding="endTime" required="true"}}
        </li>
        <li>
          {{view Calendar.Select
            label="Client"
            contentBinding="clients"
            optionValuePath="content.id"
            optionLabelPath="content.name"
            selectionBinding="client"
            prompt="Select client"
            required="true"
            }}
        </li>
        <li>
          <label>Comments</label>{{view Ember.TextArea valueBinding="comments"}}
        </li>
        <li>
        {{view Calendar.StandardFormActions}}
        </li>
      </ul>
    </div>
  </div>

"""