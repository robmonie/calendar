class AppNavigationView

  attr_accessor :selector, :context

  def initialize(context)
    self.context = context
    self.selector = "#navigation"
  end

  def show_clients
    context.find("#{selector} .clients a").click
  end

end