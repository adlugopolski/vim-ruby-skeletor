require "rails_helper"

RSpec.describe [:CLASSNAME:] do
  describe ".call" do
    subject { described_class }

    it { should forward_to_instance(:call).with_1_args }
  end

  describe "#call" do
    let(:service) { described_class.new(params) }
    let(:params) { {} }

    it "description" do
      pending "#{__FILE__}"
    end
  end
end
