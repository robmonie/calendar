CalendarPlugin.User = Ember.Object.extend

  id:   null
  name: null

CalendarPlugin.User.reopenClass

  findAllByBusiness: (businessId) ->
    users = []
    users.set 'status', 'loading'

    req = $.ajax
      url: "/api/businesses/#{businessId}/users"
      type: 'GET'
      dataType: 'json'
    req.done (data) =>
      Ember.run ->
        users.beginPropertyChanges()
        data.forEach (item) ->
          users.pushObject CalendarPlugin.User.create
            id:   item.id
            name: item.name

          users.sort (a, b) ->
            a.get('name') < b.get('name')

        users.set 'status', 'ready'
        users.endPropertyChanges()

    req.fail (e)->
      users.set 'status', 'error'
      console.error 'failed loading users'

    users