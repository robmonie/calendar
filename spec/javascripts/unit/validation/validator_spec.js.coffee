#= require unit_spec_helper

describe "validation/validator", ->

  validator = null

  describe "with basic required validator configuration", ->
    beforeEach ->
      validator = createField("{{view TestField required='true'}}").get('validator')

    it "inherits the 'required' rule from host", ->
      validator.get('required').should.be.true

    it "failing validation updates messages on host field", ->
      Ember.run ->
        validator.validate('')

      validator.get('host.errorMessages').length.should.equal(1)

    it "passing validation clears messages on host field", ->

      Ember.run ->
        validator.set('host.errorMessages', ['message'])
        validator.validate('1')

      validator.get('host.errorMessages').length.should.equal(0)

  describe "with email validator", ->
    beforeEach ->
      validator = createField("{{view TestField validators='email'}}").get('validator')

    it "extracts validation rules from field definition", ->
      validator.get('rules').length.should.equal(1)
      validator.get('rules')[0].should.equal(Calendar.validatorRegistry.byKey('email'))

    it "extracts validation rules from field definition", ->
      validator.get('rules').length.should.equal(1)


  describe "with required and email rules", ->
    it "doesn't evaluate rules if required validation fails", ->
      Ember.run ->
        validator = createField("{{view TestField required='true' validators='email'}}").get('validator')
        validator.validate('')

      validator.get('host.errorMessages').length.should.equal(1)
      validator.get('host.errorMessages')[0].should.equal(Calendar.validatorRegistry.byKey('required').message)

    it "does evaluate rules if required validation passes", ->
      Ember.run ->
        validator = createField("{{view TestField required='true' validators='email'}}").get('validator')
        validator.validate('not an email')

      validator.get('host.errorMessages').length.should.equal(1)
      validator.get('host.errorMessages')[0].should.equal(Calendar.validatorRegistry.byKey('email').message)

  describe "with multiple validation rules", ->
    it "parses and creates rules for each configured validator", ->
      Ember.run ->
        validator = createField("{{view TestField validators='email number minLength(1) maxLength(1) numberRange(1..3)'}}").get('validator')

      validator.get('rules').length.should.equal 5


  describe "with unknown validation rules", ->
    it "ignore and logs unknown validation rule", ->
      nonExistentValidatorKey = 'garbage'
      sinon.spy(console, 'error')

      Ember.run ->
        validator = createField("{{view TestField validators='#{nonExistentValidatorKey}'}}").get('validator')
        console.error.should.have.been.calledWith("There is no validator registered under the key '" + nonExistentValidatorKey + "'. Double check the name in the validator registry.")


  describe "when contained by a view that is a validation group", ->

    validationGroup = null

    beforeEach ->
      Ember.run ->
        validationGroup = createValidationGroupWithField()
        validator = Ember.View.views[$('.test-field')[0].id].get('validator')

    it "notifies validation group of validity", ->
      sinon.spy(validationGroup, 'notifyValidity')
      Ember.run ->
        validator.validate('')
      validationGroup.notifyValidity.should.have.been.calledWith(validator, false)

      Ember.run ->
        validator.validate('a')
      validationGroup.notifyValidity.should.have.been.calledWith(validator, true)



window.TestField = Calendar.ValidatableField.extend
  classNames: 'test-field'
  fieldViewClass: Ember.TextField

window.ValidationGroupView = Ember.View.extend Calendar.ValidationGroupMixin, {
  classNames: ['validation-group']
  template: Ember.Handlebars.compile """
    {{view TestField required='true'}}
  """
}

createField = (template) ->
  Ember.run ->
    Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
      #{template}
    """
    Calendar.reset()

  Ember.View.views[$('.test-field')[0].id]

createValidationGroupWithField = ->

  Ember.run ->
    Ember.TEMPLATES['application'] = Ember.Handlebars.compile """
      {{view ValidationGroupView}}
    """
    Calendar.reset()

  Ember.View.views[$('.validation-group')[0].id]
