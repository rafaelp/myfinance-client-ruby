require "spec_helper"

describe Myfinance::Resources::Entity do
  describe ".find_all", vcr: true do
    context "when success" do
      subject { described_class.find_all }

      it "returns a find_all of orders" do
        expect(subject.class).to eq(Myfinance::Resources::EntityCollection)
        expect(subject.collection.first.class).to eq(Myfinance::Resources::Entity)
        expect(subject.collection.first.id).to eq(3798)
        expect(subject.collection.first.name).to eq("Minhas Finanças")
        expect(subject.collection.first.account_id).to eq(3613)
        expect(subject.collection.first.charging_uuid).to be_nil
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-07-29T11:04:45-03:00"))
        expect(subject.collection.first.default_in_menu).to be_truthy
        expect(subject.collection.first.deleted_at).to be_nil
        expect(subject.collection.first.federation_subscription_number).to eq("")
        expect(subject.collection.first.imported_from_sync_at).to be_nil
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-07-29T14:30:36-03:00"))
        expect(subject.collection.count).to eq(1)
      end
    end

    context "when not found" do
      before { Myfinance.configuration.token = "wrong-token" }
      subject { described_class.find_all }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe ".find", vcr: true do
    context "when success" do
      subject { described_class.find(3798) }

      it "returns a find_all of orders" do
        expect(subject.class).to eq(Myfinance::Resources::Entity)
        expect(subject.id).to eq(3798)
        expect(subject.name).to eq("Minhas Finanças")
        expect(subject.account_id).to eq(3613)
        expect(subject.charging_uuid).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-07-29T11:04:45-03:00"))
        expect(subject.default_in_menu).to be_truthy
        expect(subject.deleted_at).to be_nil
        expect(subject.federation_subscription_number).to eq("")
        expect(subject.imported_from_sync_at).to be_nil
        expect(subject.updated_at).to eq(DateTime.parse("2015-07-29T14:30:36-03:00"))
      end
    end

    context "when not found" do
      before { Myfinance.configuration.token = "wrong-token" }
      subject { described_class.find(3798) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end
