require "spec_helper"
require_relative "../app/extractor.rb"
require_relative "support/vim.rb"

RSpec.describe Extractor do
  describe "#call" do
    let(:service) { described_class.new(filepath) }

    context "with full path" do
      let(:filepath) { "/root/path/app/services/some/cool_object.rb" }

      it "parses argument from vim" do
        expect(service.call).to eq "Some::CoolObject"
      end
    end

    context "with relative path" do
      let(:filepath) { "app/services/some/cool_object.rb" }

      it "parses argument from vim" do
        expect(service.call).to eq "Some::CoolObject"
      end
    end

    context "with full spec path" do
      let(:filepath) { "/root/spec/services/some/cool_object_spec.rb" }

      it "parses argument from vim" do
        expect(service.call).to eq "Some::CoolObject"
      end
    end

    context "with relative spec path" do
      let(:filepath) { "spec/services/some/cool_object.rb" }

      it "parses argument from vim" do
        expect(service.call).to eq "Some::CoolObject"
      end
    end
  end
end
