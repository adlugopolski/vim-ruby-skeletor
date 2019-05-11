require_relative "../parser.rb"
require_relative "./performer.rb"
require_relative "../vim_aliases.rb"

class Parser::RelativeRunner
  def self.call(*args)
    new(*args).call
  end

  def initialize(line, current_file)
    self.line = line
    self.current_file = current_file
  end

  def call
    Parser::Performer.call(pathname)
  end

  private

  attr_accessor :line, :current_file

  def pathname
    Parser.call(line, prefix: prefix)
  end

  def prefix
    current_file.sub(/\.rb$/, "")
  end
end
