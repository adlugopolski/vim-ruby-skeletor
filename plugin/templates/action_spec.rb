require "rails_helper"

RSpec.describe [:CLASSNAME:] do
  let(:service) { described_class.new(params, user, request) }
  let(:params) { }
  let(:user) { instance_double(User) }
  let(:request) { instance_double(ActionDispatch::Request) }

  describe "#collection" do
    it "returns collection" do
      pending "#{__FILE__}"
    end
  end
end
