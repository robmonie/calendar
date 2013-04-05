#=require ./view_model
class ViewModel.Editor extends ViewModel.Base

  selector: "#editor"

  fillIn: ->

    #probably want to handle selectors as well as labels
    if arguments.length == 1
      _.each arguments[0], (value, labelText) =>
        @fieldForLabel(labelText).val(value)

    else if arguments.length == 2
      @fieldForLabel(arguments[0]).val(arguments[1])

  fieldValue: (labelText) ->
    @fieldForLabel(labelText).val()

  saveWithResponse: (response) ->
    @withServerResponse(@save, response)

  withServerResponse: (fn, response) ->
    server = sinon.fakeServer.create()
    fn.apply(this)
    server.requests[0].respond(response.status, response.headers, JSON.stringify(response.body));

  save: ->
    @find("button.save").click()

  delete: ->
    @find("button.delete").click()

