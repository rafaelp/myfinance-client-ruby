require "spec_helper"

describe Myfinance::Resources::CreditCard, vcr: true do
  let(:cc_klass) { Myfinance::Entities::CreditCard }
  let(:entity_id) { 3798 }
  let(:cc_id) { 44 }
  let(:credit_cards) { client.credit_cards }
  let(:request_error) { Myfinance::RequestError }

  describe "#find_all" do
    context "when successful" do
      subject { credit_cards.find_all(entity_id) }
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
      subject { credit_cards.find_all(nil) }
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
      subject { credit_cards.find(nil, nil) }

      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

  describe "#create" do
    context "when successful"  do
      let(:params) { { name: "Nubank", flag: "MasterCard", closing_day: 20, expiration_day: 02 } }
      subject { credit_cards.create(entity_id, params) }

      it "creates a CreditCard" do
        expect(subject).to be_a(cc_klass)
      end

      it "contains given params" do
        expect(subject).to have_attributes(params)
      end
    end

    context "when given invalid params" do
      let(:params) { { name: "Nubank", flag: "BandeiraDeWesteros", closing_day: 20, expiration_day: 02 } }
      subject { credit_cards.create(entity_id, params) }

      it "returns 422 Unprocessable Entity" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(422)
          expect(e.message).to eq("Unprocessable Entity")
        end
      end
    end
  end

  describe "#update" do
    context "when successful"  do
      let(:params) { { name: "Neon", flag: "Visa", closing_day: 20, expiration_day: 02 } }
      subject { credit_cards.update(entity_id, cc_id, params) }

      it "updates a CreditCard" do
        expect(subject).to be_a(cc_klass)
      end

      it "contains given params" do
        expect(subject).to have_attributes(params)
      end
    end

    context "when given invalid params" do
      let(:params) { { name: "Nubank", flag: "BandeiraDeWesteros", closing_day: 20, expiration_day: 02 } }
      subject { credit_cards.update(entity_id, cc_id, params) }

      it "returns 422 Unprocessable Entity" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(422)
          expect(e.message).to eq("Unprocessable Entity")
        end
      end
    end
  end

  describe "#destroy" do
    let(:params) { { name: "Nubank", flag: "MasterCard", closing_day: 20, expiration_day: 02 } }
    let(:new_cc) { credit_cards.create(entity_id, params) }

    context "when successful"  do
      before :each do
        credit_cards.destroy(entity_id, new_cc.id)
      end

      it "does not find deleted CreditCard" do
        expect { credit_cards.find(entity_id, new_cc.id) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end

    context "when given invalid ID" do
      it "returns 404 Not Found" do
        expect { credit_cards.destroy(entity_id, 424242) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

end
