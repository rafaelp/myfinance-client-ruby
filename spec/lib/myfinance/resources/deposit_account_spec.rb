require "spec_helper"

describe Myfinance::Resources::DepositAccount, vcr: true do
  let(:entity_klass) { Myfinance::Entities::DepositAccount }

  describe "#find_all" do
    context "when success" do
      subject { client.deposit_accounts.find_all(3798) }

      it "show all deposit accounts" do
        subject.build
        expect(subject).to be_a(Myfinance::Entities::DepositAccountCollection)
        expect(subject.collection.first).to be_a(entity_klass)
        expect(subject.collection.first.name).to eq("Carteira")
      end
    end

    context "when error" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.deposit_accounts.find_all(3798)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "when success" do
      it "show a deposit account successfully" do
        result = client.deposit_accounts.find(3798, 14268)
        expect(result).to be_a(entity_klass)
        expect(result.name).to eq("Carteira")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.deposit_accounts.find(3798, 888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    context "when success" do
      let(:params) do
        {
          archive: false,
          bank_account_id: 141,
          currency_id: 1,
          deposit_account_type_id: 2,
          description: "Deposit account test",
          entity_id: 3798,
          force_destroy: false,
          imported_from_sync: false,
          name: "Caixa 18",
          calculated_balance: "34290.11",
          logo_image_url: "logos/logo-bank-bradesco.png"
        }
      end

      it "creates a deposit account successfully" do
        result = client.deposit_accounts.create(3798, params)
        expect(result).to be_a(entity_klass)
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.deposit_accounts.create(3798, {})
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "when success" do
      it "updates a deposit account successfully" do
        expect(
          client.deposit_accounts.update(3798, 14820, { name: "Name" })
        ).to be_a(entity_klass)
      end
    end

    context "when invalid" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.deposit_accounts.update(3798, 14820, { name: "" })
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#delete" do
    context "when success" do
      it "destroy a deposit account successfully" do
        expect(client.deposit_accounts.destroy(3798, 14820)).to be_truthy
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.deposit_accounts.destroy(3798, 888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end
