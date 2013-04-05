#= require functional_spec_helper

describe "availability creation", ->

  appNavigation = null

  beforeEach ->
    appNavigation = new ViewModel.AppNavigation()

  it "creates and lists a new availability", ->
    appNavigation.showAvailabilities()
    availabilitiesList = new ViewModel.AvailabilitiesList()
    availabilitiesList.length().should.equal(0)

    availabilityEditor = availabilitiesList.createAvailability()

    fieldValues =
      'Weekday': Calendar.WEEK_DAYS[2].index
      'Start hour': 10
      'Start minute': 30
      'End hour': 11
      'End minute': 30

    availabilityEditor.fillIn(fieldValues)

    availabilityEditor.saveWithResponse
      status: 200
      headers: { "Content-Type": "application/json" }
      body: {"availability":{"id":1,"weekday_index":2,"start_hour":10,"start_minute":30,"end_hour":11,"end_minute":30}}

    availabilitiesList.length().should.equal(1)

    availabilityEditor = availabilitiesList.editAt(0)

    _.each fieldValues, (value, labelText) ->
      availabilityEditor.fieldValue(labelText).should.equal(String(value))





