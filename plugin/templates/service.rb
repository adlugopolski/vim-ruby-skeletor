class [:CLASSNAME:]
  def self.call(...)
    new(...).call
  end

  def initialize(arg)
    self.arg = arg
  end

  def call
  end

  private

  attr_accessor :arg
end
