require_relative "../parser.rb"
require_relative "./performer.rb"
require_relative "../vim_aliases.rb"

class Parser::Runner
  def self.call(*args)
    new(*args).call
  end

  def initialize(line)
    self.line = line
  end

  def call
    Parser::Performer.call(pathname)
  end

  private

  attr_accessor :line

  def pathname
    @_pathname ||= Parser.call(line)
  end
end
