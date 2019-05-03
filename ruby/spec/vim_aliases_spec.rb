require "spec_helper"
require_relative "../app/vim_aliases.rb"
require_relative "../support/vim.rb"

RSpec.describe "vim_aliases.rb" do
  before do
    allow(Vim).to receive_messages(
      command: :command,
      evaluate: :evaluate,
    )
  end

  describe "VimC" do
    it "runs a command" do
      VimC("data")

      expect(Vim)
        .to have_received(:command)
        .with("data")
    end
  end

  describe "VimR" do
    it "runs formatted command" do
      VimR("data")

      expect(Vim)
        .to have_received(:command)
        .with("return 'data'")
    end
  end

  describe "VimE" do
    it "runs evaluated value" do
      VimE("data")

      expect(Vim)
        .to have_received(:evaluate)
        .with("data")
    end
  end
end
