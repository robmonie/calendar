CalendarPlugin.SelectFieldView = Ember.CollectionView.extend

  tagName: 'select'
  attributeBindings: ['name', 'tabindex']
  options: []
  value: null
  classNames: ['force-validate']
  wrapperClassNames: ['select-field']
  labelProperty: 'label'
  valueProperty: 'value'
  emptyLabel: ''
  emptyValue: ''

  content: ( ->
    valueProperty = this.get('valueProperty')
    labelProperty = this.get('labelProperty')
    options = [].concat @get('options')
    emptyObject = Ember.Object.create()
    emptyObject.set labelProperty, @get("emptyLabel")
    emptyObject.set valueProperty, @get("emptyValue")
    options.unshift emptyObject
    console.log options
    options
  ).property('options').cacheable()

  init: ->

    valueProperty = this.get('valueProperty')
    labelProperty = this.get('labelProperty')

    @set 'itemViewClass', Ember.View.extend
      tagName: "option"
      selected: ( ->
        if @getPath('content') == @getPath('parentView.value')
          "selected"
        else
          null
      ).property("parentView.#{valueProperty}")

      valueBinding: "content.#{valueProperty}"
      attributeBindings: ['selected', 'value']
      template: Ember.Handlebars.compile("{{content.#{labelProperty}}}")

    @_super()

  focusOut: (event) ->
    @_elementValueDidChange()
    false

  change: (event) ->
    @_elementValueDidChange()
    false

  keyUp: (event) ->
    @interpretKeyEvents event
    false

  _elementValueDidChange: ->
    elVal = @$().val()
    val = Number(elVal)
    val = elVal if isNaN(val)
    @set 'value', @get('options').findProperty(@get('valueProperty'), val)

