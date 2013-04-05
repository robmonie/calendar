#= require unit_spec_helper

describe "validation/validatable_field", ->

  fieldView = null
  label = 'Test Field'
  hint = "hint text"

  beforeEach ->
    fieldView = createField("{{view TestField label='#{label}' hint='#{hint}'}}")

  it "renders with label", ->
    fieldView.$('label').text().should.equal(label)

  it "renders with field", ->
    fieldView.$('input').length.should.equal(1)

  it "initialises as valid", ->
    fieldView.get('isValid').should.be.true

  it "shows hint text when not in error state", ->
    fieldView.$('.help-block').should.have.text(hint)

  it "doesn't show error messages if field hasn't had focus", ->
    Ember.run ->
      fieldView.set('errorMessages', ['my error'])

    fieldView.$().should.not.have.class('error')
    fieldView.$('.help-block').should.not.have.text('my error')

  it "adds/removes error text in html when error messages are added/removed", ->
    Ember.run ->
      fieldView.set('hasHadFocus', true)
      fieldView.set('errorMessages', ['my error'])

    fieldView.$().should.have.class('error')
    fieldView.$('.help-block').should.have.text('my error')

    Ember.run ->
      fieldView.set('errorMessages', [])

    fieldView.$().should.not.have.class('error')
    fieldView.$('.help-block').should.not.have.text('my error')
    fieldView.$('.help-block').should.have.text(hint)

  it "shows all error messages", ->
    Ember.run ->
      fieldView.set('hasHadFocus', true)
      fieldView.set('errorMessages', ['error 1', 'error 2'])

    fieldView.$('.help-block').should.contain('error 1')
    fieldView.$('.help-block').should.contain('error 2')


  it "destroys validator on destroy", ->
    validator = fieldView.get('validator')
    sinon.spy(validator, 'destroy')
    Ember.run ->
      fieldView.destroy()
    validator.destroy.should.have.been.calledOnce




window.TestField = Calendar.ValidatableField.extend
  classNames: 'test-field'
  fieldViewClass: Ember.TextField


createField = (template) ->
  Ember.run ->
    Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
      #{template}
    """
    Calendar.reset()

  Ember.View.views[$('.test-field')[0].id]