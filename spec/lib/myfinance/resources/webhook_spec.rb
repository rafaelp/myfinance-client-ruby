require "spec_helper"

describe Myfinance::Resources::Webhook, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Webhook }

  describe "#find_all" do
    context "when success" do
      subject { client.webhooks.find_all }

      it "show all webhooks successfully" do
        expect(subject.class).to eq(Myfinance::Entities::WebhookCollection)
        expect(subject.collection.first.description).to eq("Webhook test")
        expect(subject.collection.first.id).to eq(76)
      end
    end

    context "when error" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.webhooks.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "when success" do
      subject { client.webhooks.find(76) }

      it "find a webhook successfully" do
        expect(subject).to be_a(entity_klass)
        expect(subject.id).to eq(76)
        expect(subject.description).to eq("Webhook test")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.webhooks.find(888888)
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
          entity_id: 3798,
          description: "Webhook 2",
          url: "https://sandbox.myfinance.com.br/docs/api/webhooks#get_show",
          format: "json"
        }
      end

      it "creates a webhook successfully" do
        result = client.webhooks.create(params)
        expect(result).to be_a(entity_klass)
        expect(result.description).to eq("Webhook 2")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.webhooks.create({ description: "" })
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "when success" do
      let(:params) { { description: "Description updated" } }

      it "updates a webhook successfully" do
        result = client.webhooks.update(76, params)
        expect(result).to be_a(entity_klass)
        expect(result.description).to eq("Description updated")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.webhooks.update(76, { url: "" })
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "when success" do
      it "destroy a webhook successfully" do
        expect(client.webhooks.destroy(77)).to be_truthy
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.webhooks.destroy(888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end
