class [:CLASSNAME:]
  def self.call(...)
    new(...).call
  end

  def initialize(field)
    self.field = field
  end

  def call
    parent
  end

  delegate :parent, to: :class

  private

  attr_accessor :field
end
