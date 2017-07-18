require "spec_helper"

describe Myfinance::Entities::CustomClassifierCollection do
  let(:entity_klass) { Myfinance::Entities::CustomClassifier }

  let(:response) do
    double(
      headers: {},
      parsed_body: [
        {
          "custom_classifier" => {
            "account_id" => 3613,
            "created_at" => "2015-07-29T11:04:50-03:00",
            "id" => 532_314,
            "name" => "Alimentação",
            "updated_at" => "2015-07-29T11:04:50-03:00"
          }
        }
      ]
    )
  end

  subject { Myfinance::Entities::CustomClassifierCollection.new(response) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build.class).to eq(Myfinance::Entities::CustomClassifierCollection)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(entity_klass)
    end
  end
end
