require "spec_helper"

describe Myfinance::Resources::Reconcile, vcr: true do
  let(:entity_id) { 3798 }
  let(:da_id) { 14268 }
  let(:date) { "2017-01-01" }
  let(:ft) { client.financial_transactions.create(entity_id, da_id, type: "Credit", amount: 150.0, occurred_at: date) }
  let(:ra_params) do
    { due_date: "2017-01-01", amount: 150.0, occurred_at: "2017-01-01", total_amount: 150.0 }
  end
  let(:ra) { client.receivable_accounts.create(entity_id, ra_params) }

  describe "#reconcile" do
    subject { client.reconciles.reconcile(entity_id, [ra.id], [ft.id]) }
    it "returns 200 OK response code" do
      expect(subject.response.code).to eq(200)
    end

    it "returns the selected FAs and FTs" do
      expect(subject.collection.first.id).to eq(ft.id)
      expect(subject.collection.last.id).to eq(ra.id)
    end

    it "expects FT to be reconciled" do
      expect(subject.collection.first.reconciled).to be_truthy
    end

    it "expects FA to be reconciled with FT" do
      reconciliation = subject.collection.last.reconciliations["financial_transactions"].first
      expect(reconciliation["id"]).to eq(ft.id)
    end
  end
end
