#= require plugin/view/wizard_page_view
CalendarPlugin.ConfirmationView = CalendarPlugin.WizardPageView.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/confirmation"

  # isVisible: (->
  #   CalendarPlugin.bookingController.get('currentWizardPage') == 3
  # ).property('content.currentWizardPage')
