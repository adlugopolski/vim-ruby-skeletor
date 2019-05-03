require "spec_helper"
require_relative "../app/underscore.rb"

RSpec.describe Underscore do
  let(:result) { Sample.call("Some::ClassName") }

  before do
    class Sample
      using Underscore

      def self.call(string)
        string.underscore
      end
    end
  end

  context "with refinement" do
    it "converts the class name to file name" do
      expect(result).to eq "some/class_name"
    end
  end

  context "without refinement" do
    let(:result) { "SomeString" }

    it "doesn't respond to underscore" do
      expect(result).not_to respond_to(:underscore)
    end
  end
end
