require 'spec_helper'

describe Myfinance::Entities::PersonCollection do
  let(:response) do
    double(
      headers: {},
      parsed_body: [
        {}
      ]
    )
  end

  subject { described_class.new(response) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build.class).to eql(Myfinance::Entities::PersonCollection)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(Myfinance::Entities::Person)
    end
  end
end