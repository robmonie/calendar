#= require plugin/view/select_field_view

CalendarPlugin.PluginContainerView = Ember.View.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/plugin_container"

  PractitionerSelectFieldView: CalendarPlugin.SelectFieldView.extend
    optionsBinding: SC.Binding.oneWay "parentView.content.practitioners"
    valueBinding:   "parentView.content.booking.practitioner"
    labelProperty:  'name'
    valueProperty:  'id'
    emptyLabel:     'Select a Practitioner'

