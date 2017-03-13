require "spec_helper"

describe Myfinance::Resources::Account, vcr: true do
  let(:entity_klass) { described_class }

  describe "#find_all" do
    context "with success" do
      subject { client.accounts.find_all }

      it "show all accounts successfully" do
        expect(subject).to be_a(Myfinance::Entities::AccountCollection)
        expect(subject.collection.first).to be_a(Myfinance::Entities::Account)
      end
    end

    context "with error" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.accounts.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end
end
