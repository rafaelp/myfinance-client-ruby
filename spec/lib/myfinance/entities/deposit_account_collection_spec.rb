require "spec_helper"

describe Myfinance::Entities::DepositAccountCollection do
  let(:entity_klass) { described_class }

  let(:params) { double(headers: {}, parsed_body: [{}]) }

  subject { entity_klass.new(params) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build).to be_a(entity_klass)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first).to be_a(
        Myfinance::Entities::DepositAccount
      )
    end
  end
end
