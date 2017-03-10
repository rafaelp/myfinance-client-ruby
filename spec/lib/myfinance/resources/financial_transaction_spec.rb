require "spec_helper"

describe Myfinance::Resources::FinancialTransaction, vcr: true do
  describe "#find_all" do
    context "when successful" do
      subject { client.financial_transactions.find_all(3798, 14268) }
      before :each do
        subject.build
      end

      it "returns a 200 OK response code" do
        expect(subject.response.code).to eq(200)
      end

      it "return collection of FinancialTransactions" do
        expect(subject).to be_a(Myfinance::Entities::FinancialTransactionCollection)
      end

      it "returns an array of financial_transactions" do
        expect(subject.collection).to be_a(Array)
      end
    end

    context "when supplying invalid IDs" do
      let(:financial_transactions) { client.financial_transactions }
      
      it "raises not found error with error 404" do
        expect{ financial_transactions.find_all(nil, nil) }.to raise_error(Myfinance::RequestError) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
