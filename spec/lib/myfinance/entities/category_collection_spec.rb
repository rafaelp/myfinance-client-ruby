require "spec_helper"

describe Myfinance::Entities::CategoryCollection do
  let(:entity_klass) { Myfinance::Entities::Category }

  let(:response) do
    double(
      headers: {},
      parsed_body: [
        {
          "category" => {
            "account_id" => 3613,
            "cost" => true,
            "created_at" => "2015-07-29T11:04:50-03:00",
            "excel_import_id" => nil,
            "force_destroy" => false,
            "full_name" => "Alimentação",
            "guid" => nil,
            "id" => 532314,
            "imported_from_sync" => false,
            "interested_users_ids" => [],
            "modified_by_sync" => false,
            "name" => "Alimentação",
            "parent_id" => nil,
            "revenue" => true,
            "updated_at" => "2015-07-29T11:04:50-03:00",
            "use_count" => 0
          }
        }
      ]
    )
  end

  subject { Myfinance::Entities::CategoryCollection.new(response) }

  describe "#build" do
    it "returns order collection" do
      expect(subject.build.class).to eq(Myfinance::Entities::CategoryCollection)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(entity_klass)
    end
  end
end
