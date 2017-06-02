require "spec_helper"

describe Myfinance::Resources::SaleAccount, vcr: true do
  let(:client) do
    equipemyfinance_api_token = "b8e224ea249c9e01a31ce19d4f92e2baca3d5055a1ce0cf0"
    equipemyfinance_account_id = 3539
    Myfinance.client(equipemyfinance_api_token, equipemyfinance_account_id)
  end
  let(:resource) { client.sale_accounts }
  let(:entity_class) { Myfinance::Entities::SaleAccount }
  let(:collection_class) { Myfinance::Entities::SaleAccountCollection }
  let(:request_error) { Myfinance::RequestError }
  let(:entity) { 3703 }
  let(:sale_account_id) { 7 }

  describe "#find_all" do
    subject { resource.find_all }

    it "returns a 200 OK response code" do
      expect(subject.response.code).to eq(200)
    end

    it "returns a SaleAccounts collection" do
      expect(subject).to be_a(collection_class)
    end

    it "returns items as SaleAccount" do
      expect(subject.collection).to all(be_a(entity_class))
    end

    context "with invalid arguments" do
      let(:sale_account_id) { nil }

      it "raises not found error" do
        expect { subject }.to raise_error(request_error, "Not Found")
      end
    end
  end

  describe "#find" do
    subject { resource.find(sale_account_id) }

    it "returns a Sale" do
      expect(subject).to be_a(entity_class)
    end

    context "with invalid arguments" do
      let(:sale_account_id) { nil }

      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error, "Not Found")
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        provider: "pagseguro",
        name: "PagSeguro",
        description: "Conta do PagSeguro",
        entity_id: entity_id
      }
    end

    subject { resource.create(sale_account_id, params) }

    it "creates a Sale" do
      expect(subject).to be_a(entity_class)
    end

    context "when given invalid params" do
      let(:params) do
        {
          provider: "amarelinha",
        }
      end

      it "returns 422 Unprocessable Entity" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e).to have_attributes(
            code: 422,
            message: "Unprocessable Entity"
          )
        end
      end
    end
  end

  describe "#update" do
    let(:params) do
      {
        nominal_amount: BigDecimal.new(999),
        description: "Amarelinha"
      }
    end
    subject { resource.update(sale_account_id, params) }

    it "updates a Sale" do
      expect(subject).to be_a(entity_class)
    end
  end

  describe "#destroy" do
    let(:sale_account_id) { 10 }

    subject { resource.destroy(sale_account_id) }

    it "destroys Sale" do
      expect(subject).to be_truthy
    end

    context "when given invalid ID" do
      let(:sale_account_id) { 171 }

      it "returns 404 Not Found" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
