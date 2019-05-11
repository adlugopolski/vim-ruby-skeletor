class [:CLASSNAME:]
  def initialize(params, user, request)
    self.params = params
    self.user = user
    self.request = request
  end

  def collection
  end

  private

  attr_accessor :params, :user, :request
end
