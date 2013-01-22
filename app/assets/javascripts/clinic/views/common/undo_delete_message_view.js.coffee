Calendar.UndoDeleteMessageView = Ember.View.extend

  message: 'You have just deleted a record'

  template: Ember.Handlebars.compile """
    <div class="undo-delete-message" {{bindAttr class="isTransactionCommitScheduled"}}>
      {{#if isTransactionCommitScheduled}}
        <span>{{view.message}}</span> <button class="primary" {{action "cancelCommit"}}>Undo delete</button>
      {{/if}}
    </div>
  """

