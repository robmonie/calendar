Calendar.UndoDeleteMessageView = Ember.View.extend

  message: 'You have deleted a record'

  template: Ember.Handlebars.compile """
    <div id="undo-delete-message" {{bindAttr class="isTransactionCommitScheduled"}}>
      <span>{{view.message}}</span> <button class="primary" {{action "cancelCommit"}}>Undo</button>
    </div>
  """

