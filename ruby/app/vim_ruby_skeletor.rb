require_relative "parser.rb"

def CreateNewFileFromConstantInCurrentLine()
  result = Parser.call Vim.evaluate("getline('.')")
  Vim.command("echo '#{result}'")
end
