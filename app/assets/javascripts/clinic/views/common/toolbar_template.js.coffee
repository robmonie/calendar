Ember.TEMPLATES['toolbar'] = Ember.Handlebars.compile """
  {{#each view.items}}
    {{#if action}}
      <li {{action 'toolbarAction' action}}>{{label}}</li>
    {{/if}}
    {{#if linkTo}}
      <li {{action 'toolbarLink' linkTo}}>{{label}}</li>
    {{/if}}
  {{/each}}
"""