CalendarPlugin.User = Ember.Object.extend

  id:   null
  name: null

CalendarPlugin.User.reopenClass

  findAllByBusiness: (businessId) ->
    users = []
    users.beginPropertyChanges()
    users.set 'status', 'loading'
    console.log businessId

    req = $.ajax
      url: "/api/businesses/#{businessId}/users"
      type: 'GET'
      dataType: 'json'
    req.done (data)=>
      data.forEach (item) ->
        users.push CalendarPlugin.User.create
          id:   item.id
          name: item.name

        users.sort (a, b) ->
          a.get('name') < b.get('name')

      users.set 'status', 'ready'
      users.endPropertyChanges()

    req.fail (e)->
      users.set 'status', 'error'
      users.endPropertyChanges()
      console.error 'failed loading users'

    users