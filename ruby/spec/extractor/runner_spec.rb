require "spec_helper"
require_relative "../../app/extractor/runner.rb"
require_relative "../support/vim.rb"

RSpec.describe Extractor::Runner do
  describe "#call" do
    let(:service) { described_class.new(:argument) }

    before do
      allow(Extractor).to receive_messages(call: :result)
      allow(Vim).to receive_messages(
        command: :command,
        evaluate: :evaluate,
      )
    end

    it "returns the result to vim" do
      service.call

      expect(Vim)
        .to have_received(:command)
        .with("return 'result'")
    end

    it "passes the arg to main method object" do
      service.call

      expect(Extractor)
        .to have_received(:call)
        .with(:argument)
    end
  end
end
