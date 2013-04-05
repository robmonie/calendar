# before ->
#   console.log 'running global before all'
#   Ember.run ->
#     Calendar.initialize() #initialize is called byt reset anyway

beforeEach ->
  Ember.run ->
    Calendar.reset()
