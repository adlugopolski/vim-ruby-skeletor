class [:CLASSNAME:]
  def self.call(*args)
    new(*args).call
  end

  def initialize(arg)
    self.arg = arg
  end

  def call
  end

  private

  attr_accessor :arg
end
