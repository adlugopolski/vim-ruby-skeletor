require "spec_helper"
require_relative "../../app/extractor/runner.rb"

RSpec.describe Extractor::Runner do
  describe "#call" do
    let(:service) { described_class.new(:argument) }

    it "description" do
      expect(service.call).to eq :argument
    end
  end
end
