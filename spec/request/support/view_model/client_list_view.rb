class ClientListView

  attr_accessor :context, :selector

  def initialize(context)
    self.context = context
    self.selector = ".appointments"
  end

  def size
    context.find()
  end

end