def VimC(command)
  Vim.command(command)
end

def VimR(command)
  Vim.command format("return '%<cmd>s'", cmd: command)
end

def VimE(command)
  Vim.evaluate(command)
end
