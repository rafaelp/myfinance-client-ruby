require "spec_helper"

describe Myfinance::Entities::WebhookCollection do
  let(:response) do
    double(
      headers: {},
      parsed_body: [
        {
          "webhook" => {
            "account_id" => 3613,
            "created_at" => "2015-09-21T15:41:05-03:00",
            "description" => "Webhook test",
            "entity_id" => 3798,
            "healthy_check_code" => "200",
            "id" => 76,
            "updated_at" => "2015-09-21T16:08:48-03:00",
            "url" => "https://sandbox.myfinance.com.br/docs/api/webhooks"
          }
        },{
          "webhook" => {
            "account_id" => 3613,
            "created_at" => "2015-09-21T16:15:22-03:00",
            "description" => "Webhook 1",
            "entity_id" => 3798,
            "healthy_check_code" => "200",
            "id" => 77,
            "updated_at" => "2015-09-21T16:15:35-03:00",
            "url" => "https://sandbox.myfinance.com.br/docs/api/webhooks"
          }
        }
      ]
    )
  end

  subject { Myfinance::Entities::WebhookCollection.new(response) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build).to be_a(Myfinance::Entities::WebhookCollection)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(2)
      expect(subject.collection.first).to be_a(Myfinance::Entities::Webhook)
    end
  end
end
