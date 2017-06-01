require "spec_helper"

describe Myfinance::Resources::Sale, vcr: true do
  let(:client) do
    equipemyfinance_api_token = "b8e224ea249c9e01a31ce19d4f92e2baca3d5055a1ce0cf0"
    equipemyfinance_account_id = 3539
    Myfinance.client(equipemyfinance_api_token, equipemyfinance_account_id)
  end
  let(:resource) { client.sales }
  let(:entity_class) { Myfinance::Entities::Sale }
  let(:collection_class) { Myfinance::Entities::SaleCollection }
  let(:request_error) { Myfinance::RequestError }
  let(:entity_id) { 3703 }
  let(:sale_id) { 8 }
  let(:sale_account_id) { 7 }

  describe "#find_all" do
    subject { resource.find_all(entity_id) }

    it "returns a 200 OK response code" do
      expect(subject.response.code).to eq(200)
    end

    it "returns a Sales collection" do
      expect(subject).to be_a(collection_class)
    end

    it "returns items as Sale" do
      expect(subject.collection).to all(be_a(entity_class))
    end

    context "with invalid arguments" do
      let(:entity_id) { nil }

      it "raises not found error" do
        expect { subject }.to raise_error(request_error, "Not Found")
      end
    end
  end

  describe "#find" do
    subject { resource.find(entity_id, 8) }

    it "returns a Sale" do
      expect(subject).to be_a(entity_class)
    end

    context "with invalid arguments" do
      let(:entity_id) { nil }

      it "raises not found error with 404" do
        expect { subject }.to raise_error(request_error, "Not Found")
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        nominal_amount: BigDecimal.new(199),
        payment_method: "cash",
        occurred_at: Date.new(2017, 1, 1), description: "O Guia",
        sale_account_id: sale_account_id
      }
    end

    subject { resource.create(entity_id, params) }

    it "creates a Sale" do
      expect(subject).to be_a(entity_class)
    end

    context "when given invalid params" do
      let(:params) do
        {
          amount: BigDecimal.new(199),
          description: "O Guia"
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
        description: "O Guia Vol. II"
      }
    end
    subject { resource.update(entity_id, sale_id, params) }

    it "updates a Sale" do
      expect(subject).to be_a(entity_class)
    end
  end

  describe "#destroy" do
    let(:sale_id) { 17 }

    subject { resource.destroy(entity_id, sale_id) }

    it "destroys Sale" do
      expect(subject).to be_truthy
    end

    context "when given invalid ID" do
      let(:sale_id) { 171 }

      it "returns 404 Not Found" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
