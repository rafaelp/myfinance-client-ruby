require "spec_helper"

describe Myfinance::Entities::AccountCollection do
  let(:response) { double(headers: {}, parsed_body: [{}]) }

  subject { described_class.new(response) }

  describe "#build" do
    it "returns orders collection" do
      expect(subject.build).to be_a(Myfinance::Entities::AccountCollection)
    end

    it "returns orders" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(Myfinance::Entities::Account)
    end
  end
end
