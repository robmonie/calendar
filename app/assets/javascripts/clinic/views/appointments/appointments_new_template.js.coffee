Ember.TEMPLATES['appointments/new'] = Ember.Handlebars.compile """
  New Appointment

  <label>Start</label>{{view Calendar.DateTimeField valueBinding="startTime"}}
  <label>End</label>{{view Calendar.DateTimeField valueBinding="endTime"}}
  <label>Client</label>{{view Ember.Select
    contentBinding="clients"
    optionValuePath="content.id"
    optionLabelPath="content.name"
    valueBinding="client.id"
    prompt="Select client"}}

  <button {{action save}}>Save</button> {{#linkTo 'appointments'}}Cancel{{/linkTo}}

"""