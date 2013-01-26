Ember.TEMPLATES['toolbar'] = Ember.Handlebars.compile """
  {{#each item in view.items}}
    {{#if item.action}}
      <li {{action 'toolbarAction' item.action}} class="{{item.classNames}}">{{item.label}}</li>
    {{/if}}
    {{#if item.linkTo}}
      <li {{action 'toolbarLink' item.linkTo}} class="{{item.classNames}}">{{item.label}}</li>
    {{/if}}
  {{/each}}
"""