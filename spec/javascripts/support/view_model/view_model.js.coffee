window.ViewModel = {}

class ViewModel.Base

  selector: 'body'

  find: (childSelector) ->
    $("#{@selector} #{childSelector}")

  click: (childSelector) ->
    @find(childSelector).click()

  fieldForLabel: (labelText) ->
    @find("label:contains(#{labelText})").parent().find(":input")