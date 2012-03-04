CalendarPlugin.BookingWizardView = Ember.View.extend

  contentBinding: Ember.Binding.oneWay 'CalendarPlugin.bookingController'
  templateName: "plugin/view/booking_wizard"
  classNames: ['booking-wizard-view', 'container']
  currentPageBinding: 'CalendarPlugin.bookingController.currentWizardPage'
  numberOfPagesBinding: 'CalendarPlugin.bookingController.numberOfWizardPages'
  isCurrentPageValidBinding: 'CalendarPlugin.bookingController.isCurrentWizardPageValid'

  nextPage: ->
    @set('currentPage', @get('currentPage') + 1)

  previousPage: ->
    @set('currentPage', @get('currentPage') - 1)

  submit: ->
   @getPath('content.booking').submit()

  NavBottomView: Ember.View.extend

    classNames: ['nav-bottom-view', 'form-actions', 'row']

    NextButton: Ember.Button.extend
      classNames: ['btn', 'btn-primary']
      bindAttributes: 'disabled'
      template: Ember.Handlebars.compile('Next')
      isVisible: (->
        @getPath('parentView.parentView.currentPage') < @getPath('parentView.parentView.numberOfPages')
      ).property 'parentView.parentView.currentPage'
      disabledBinding: Ember.Binding.oneWay('parentView.parentView.isCurrentPageValid').not()
      click: ->
        @nearestWithProperty('currentPage').nextPage()


    PreviousButton: Ember.Button.extend
      classNames: ['btn']
      template: Ember.Handlebars.compile('Previous')
      isVisible: (->
        @getPath('parentView.parentView.currentPage') > 1
      ).property 'parentView.parentView.currentPage'

      click: ->
        @nearestWithProperty('currentPage').previousPage()

    SubmitButton: Ember.Button.extend
      classNames: ['btn', 'btn-primary']
      template: Ember.Handlebars.compile('Submit Booking')
      isVisible: (->
        @getPath('parentView.parentView.currentPage') == @getPath('parentView.parentView.numberOfPages')
      ).property 'parentView.parentView.currentPage'
      click: ->
        @nearestWithProperty('currentPage').submit()