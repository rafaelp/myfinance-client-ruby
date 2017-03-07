require "spec_helper"

describe Myfinance::Resources::Webhook, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Webhook }

  describe "#find_all" do
    context "when success" do
      subject { client.webhooks.find_all }

      it "show all webhooks successfully" do
        expect(subject.class).to eq(Myfinance::Entities::WebhookCollection)
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

  describe "#create" do
    context "when success" do
      let(:params) do
        {
entity_id: 3798,
description: "Webhook test",
url: "http://requestb.in/xssmudxs",
format: "json"
        }
      end

      it "creates a webhook successfully" do
        result = client.webhooks.create(params)
        expect(result).to be_a(entity_klass)
        expect(result.description).to eq("Webhook 1")
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
end
