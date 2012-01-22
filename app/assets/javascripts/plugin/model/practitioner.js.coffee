CalendarPlugin.Practitioner = Ember.Object.extend

  id:   null
  name: null

CalendarPlugin.Practitioner.reopenClass

  findAllByBusiness: (businessId) ->
    practitioners = []
    practitioners.beginPropertyChanges()
    practitioners.set 'status', 'loading'
    console.log businessId

    req = $.ajax
      url: "/api/businesses/#{businessId}/practitioners"
      type: 'GET'
      dataType: 'json'
    req.done (data)=>
      data.forEach (item) ->
        practitioners.push CalendarPlugin.Practitioner.create
          id:   item.id
          name: item.name

        practitioners.sort (a, b) ->
          a.get('name') < b.get('name')

      practitioners.set 'status', 'ready'
      practitioners.endPropertyChanges()

    req.fail (e)->
      practitioners.set 'status', 'error'
      practitioners.endPropertyChanges()
      console.error 'failed loading practitioners'

    practitioners