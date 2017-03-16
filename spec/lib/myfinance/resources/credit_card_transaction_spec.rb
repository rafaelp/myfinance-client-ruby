require "spec_helper"

describe Myfinance::Resources::CreditCardTransaction, vcr: true do
  let(:cct_klass) { Myfinance::Entities::CreditCardTransaction }
  let(:entity_id) { 3906 }
  let(:cc_id) { 73 }
  let(:cct_id) { 319529 }
  let(:year) { "2017" }
  let(:month) { "04" }
  let(:credit_card_transactions) { client.credit_card_transactions }
  let(:request_error) { Myfinance::RequestError }
  let(:client) { Myfinance.client("0657bac70fdf5c06ce822719568f3636a9a07b87ba617ec7", 3682) }

  describe "#find_all" do
    context "when successful" do
      subject { credit_card_transactions.find_all(entity_id, cc_id, year, month) }
      before :each do
        subject.build
      end

      it "returns a 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "returns a collection of CreditCardTransactions" do
        expect(subject).to be_a(Myfinance::Entities::CreditCardTransactionCollection)
      end

      it "returns credit cards inside collection" do
        expect(subject.collection.first).to be_a(cct_klass)
      end
    end

    context "when supplying invalid IDs" do
      subject { credit_card_transactions.find_all(nil, nil, 2017, "99") }
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
      subject { credit_card_transactions.find(entity_id, cc_id, cct_id) }

      it "returns a CreditCardTransaction" do
        expect(subject).to be_a(cct_klass)
      end
    end

    context "when supplying invalid IDs" do
      subject { credit_card_transactions.find(nil, 666, 99999) }

      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end

  describe "#create" do
    context "when successful" do
      let(:params) do
        { amount: BigDecimal.new(199), occurred_at: Date.new(2017, 1, 1), description: "O Guia", credit_card_id: cc_id }
      end
      subject { credit_card_transactions.create(entity_id, cc_id, params) }

      it "creates a CreditCardTransaction" do
        expect(subject).to be_a(cct_klass)
      end

      it "contains given params" do
        expect(subject).to have_attributes(params)
      end
    end

    context "when given invalid params" do
      let(:params) { { amount: BigDecimal.new(199), description: "O Guia" } }
      subject { credit_card_transactions.create(entity_id, cc_id, params) }

      it "returns 422 Unprocessable Entity" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(422)
          expect(e.message).to eq("Unprocessable Entity")
        end
      end
    end
  end

  describe "#update" do
    let(:params) { { amount: BigDecimal.new(999), description: "O Guia Vol. II" } }
    subject { credit_card_transactions.update(entity_id, cc_id, cct_id, params) }

    it "updates a CreditCardTransaction" do
      expect(subject).to be_a(cct_klass)
    end

    it "contains given params" do
      expect(subject).to have_attributes(params)
    end
  end

  describe "#destroy" do
    let(:params) do
      { amount: BigDecimal.new(199), occurred_at: Date.new(2017, 1, 1), description: "O Guia Obsoleto", credit_card_id: cc_id }
    end
    let(:new_cct) { credit_card_transactions.create(entity_id, cc_id, params) }

    context "when successful" do
      before :each do
        credit_card_transactions.destroy(entity_id, cc_id, new_cct.id)
      end

      it "does not find deleted CreditCardTransaction" do
        expect { credit_card_transactions.find(entity_id, cc_id, new_cct.id) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end

    context "when given invalid ID" do
      it "returns 404 Not Found" do
        expect { credit_card_transactions.destroy(entity_id, 6666, 424242) }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
