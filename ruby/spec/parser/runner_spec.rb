require "spec_helper"
require_relative "../../app/parser/runner.rb"
require_relative "../support/squish.rb"
require_relative "../support/vim.rb"

RSpec.describe Parser::Runner do
  using Squish

  let(:service) { described_class.new(object) }
  let(:object) { "SomeObject" }

  before do
    allow(Parser).to receive_messages(call: "app/services/file.rb")

    allow(Vim).to receive_messages(
      command: :command,
      evaluate: :evaluate,
    )

    allow(FileUtils).to receive(:mkdir_p)
  end

  describe "#call" do
    before { service.call }

    context "with valid path" do
      it "creates directory" do
        expect(FileUtils)
          .to have_received(:mkdir_p)
          .with("app/services")
      end

      it "opens the file in vim" do
        expect(Vim)
          .to have_received(:command)
          .with(<<-TXT.squish)
            silent exec "tabe " . "app/services/file.rb" |
            execute ":redraw!"
          TXT
      end

      it "shows the message" do
        expect(Vim)
          .to have_received(:command)
          .with %Q{echo "Opening: app/services/file.rb"}
      end
    end
  end
end
