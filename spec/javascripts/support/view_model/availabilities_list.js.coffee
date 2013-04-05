class ViewModel.AvailabilitiesList extends ViewModel.Base

  selector: ".availabilities"

  createAvailability: ->
    @click('.new-availability')
    new ViewModel.Editor()

  editAt: (index) ->
    @at(index).click()
    new ViewModel.Editor()

  at: (index) ->
    @all()[index]

  all: ->
    @find('.list .body > li > a')

  length: ->
    @all().length


