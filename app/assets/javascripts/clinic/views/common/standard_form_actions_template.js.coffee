Ember.TEMPLATES['_standard_form_actions'] = Ember.Handlebars.compile """
  <ul class="actions">
    <li>
      <button {{action save}} class="primary" {{bindAttr disabled="view.parentView.isInvalid"}}>Save</button>
    </li>
    <li>
      <button {{action close}} class="secondary" >
        {{#if isDirty}}
          Close without saving
        {{else}}
          Close
        {{/if}}
      </button>
    </li>
    {{#unless isNew}}
    <li class="delete">
      <button {{action delete}} class="alert">Delete</button>
    </li>
    {{/unless}}
  </ul>
"""