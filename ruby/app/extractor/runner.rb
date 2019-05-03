require_relative "../extractor.rb"
require_relative "../vim_aliases.rb"

class Extractor::Runner
  def self.call(*args)
    new(*args).call
  end

  def initialize(arg)
    self.arg = arg
  end

  def call
    arg
  end

  private

  attr_accessor :arg
end
