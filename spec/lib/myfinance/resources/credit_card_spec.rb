require "spec_helper"

describe Myfinance::Resources::CreditCard, vcr: true do
  let(:cc_klass) { Myfinance::Entities::CreditCard }
  let(:entity_id) { 3798 }
  let(:cc_id) { 43 }
  let(:credit_cards) { client.credit_cards }
  let(:request_error) { Myfinance::RequestError }

  describe "#find_all" do
    context "when successful" do
      subject { client.credit_cards.find_all(entity_id) }
      before :each do
        subject.build
      end

      it "returns a 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "returns a collection of CreditCards" do
        expect(subject).to be_a(Myfinance::Entities::CreditCardCollection)
      end

      it "returns credit cards inside collection" do
        expect(subject.collection.first).to be_a(cc_klass)
      end
    end

    context "when supplying invalid IDs" do
      subject { client.credit_cards.find_all(nil) }
      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

  describe "#find" do
    context "when successful" do
      subject { credit_cards.find(entity_id, cc_id) }

      it "returns a CreditCard" do
        expect(subject).to be_a(cc_klass)
      end
    end

    context "when supplying invalid IDs" do
      subject { client.credit_cards.find(nil, nil) }

      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
