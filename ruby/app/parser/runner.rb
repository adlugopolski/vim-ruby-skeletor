require_relative "../parser.rb"
require_relative "../vim_aliases.rb"

class Parser::Runner
  def self.call(*args)
    new(*args).call
  end

  def initialize(line, current_file)
    self.line = line
    self.current_file = current_file
  end

  def call
    if pathname.length.zero?
      VimC %Q{echo "Can't extract any Class name from current line."}
    else
      FileUtils.mkdir_p File.dirname(pathname)
      VimC %Q{echo "Opening: #{pathname}"}
      VimC %Q{silent exec "tabe " . "#{pathname}" | execute ":redraw!"}
    end
  end

  private

  attr_accessor :line, :current_file

  def pathname
    @_pathname ||= Parser.call(line)
  end
end
