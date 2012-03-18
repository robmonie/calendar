#= require plugin/view/wizard_page_view
CalendarPlugin.ClientDetailsView = CalendarPlugin.WizardPageView.extend
  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/client_details"

  # isVisible: (->
  #   CalendarPlugin.bookingController.get('currentWizardPage') == 2
  # ).property('content.currentWizardPage')

