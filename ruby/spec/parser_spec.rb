require "spec_helper"
require_relative "../app/parser.rb"

RSpec.describe Parser do
  describe "#call" do
    let(:service) { described_class.new(code) }

    context "with class name inside line" do
      let(:code) { "params = Order::Query::Parser.call(params[:id])" }

      it "extracts valid class name" do
        expect(service.call).to eq "app/services/order/query/parser.rb"
      end
    end

    context "with only class name in line" do
      let(:code) { "  Order::QueryParserWorker  " }

      it "extracts valid class name" do
        expect(service.call)
          .to eq "app/services/order/query_parser_worker.rb"
      end
    end

    context "without match" do
      let(:code) { "some other text" }

      it "returns nothing" do
        expect(service.call).to eq ""
      end
    end

    context "with unscoped name" do
      let(:code) { "  result_from(Something).first" }

      it "returns sample path" do
        expect(service.call).to eq "app/services/something.rb"
      end
    end
  end
end
