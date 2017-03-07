require 'spec_helper'

describe Myfinance::Entities::WebhookCollection do
  let(:response) { double(headers: {}, parsed_body: [{}]) }

  subject { described_class.new(response) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build).to be_a(Myfinance::Entities::WebhookCollection)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first).to be_a(Myfinance::Entities::Webhook)
    end
  end
end
