Calendar.Appointment = DS.Model.extend
  startTime: DS.attr 'date'
  endTime: DS.attr 'date'
  client: DS.belongsTo('Calendar.Client')