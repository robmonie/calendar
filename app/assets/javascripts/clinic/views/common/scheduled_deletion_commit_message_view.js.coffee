Calendar.UndoDeleteMessageView = Ember.View.extend

  message: 'You have just deleted a record'

  template: Ember.Handlebars.compile """
    {{#if deletionCommitScheduled}}
      <div class="undo-delete-message">
        <span>{{view.message}}</span> <button class="primary" {{action "cancelCommit"}}>Undo delete</button>
      </div>
    {{/if}}
  """

