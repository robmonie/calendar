Ember.TEMPLATES['_standard_form_actions'] = Ember.Handlebars.compile """
  <ul class="actions">
    <li>
      <button {{action save}} class="primary" {{bindAttr disabled="view.parentView.isInvalid"}}>Save</button>
    </li>
    {{#ifAllowDelete}}
      <li class="delete">
        <button {{action delete}} class="alert">Delete</button>
      </li>
    {{/ifAllowDelete}}
  </ul>
"""