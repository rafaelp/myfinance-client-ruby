require "spec_helper"

describe Myfinance::Entities::TaxCollection do
  let(:entity_klass) { described_class }

  let(:params) { double(headers: {}, parsed_body: [{}]) }

  subject { described_class.new(params) }

  context "#build" do
    it "returns order collection" do
      expect(subject.build).to be_a(entity_klass)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(
        subject.collection.first
      ).to be_a(Myfinance::Entities::Tax)
    end
  end
end
