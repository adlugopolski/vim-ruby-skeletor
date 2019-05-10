require "spec_helper"
require_relative "../../app/parser/runner.rb"
require_relative "../support/squish.rb"
require_relative "../support/vim.rb"

RSpec.describe Parser::Runner do
  using Squish

  let(:service) { described_class.new(object) }
  let(:object) { "SomeObject" }

  before do
    allow(Parser::Performer).to receive(:call)
    allow(Parser).to receive_messages(call: :parser)
  end

  describe "#call" do
    before { service.call }

    it "shows the message" do
      expect(Parser::Performer)
        .to have_received(:call)
        .with(:parser)
    end
  end
end
