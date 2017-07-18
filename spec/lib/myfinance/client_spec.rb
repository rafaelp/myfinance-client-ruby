require "spec_helper"

describe Myfinance::Client do
  subject { client }

  shared_examples :resource do |method, type|
    describe "##{method}" do
      it "instantiates a new #{type}" do
        allow(type).to receive(:new)
        subject.send(method)
        expect(type).to have_received(:new).with(subject.http)
      end
    end
  end

  describe "#initialize" do
    it "instantiates a new Myfinance::Http object" do
      expect(Myfinance::Http).to receive(:new).with("abc", nil)
      Myfinance::Client.new("abc")
    end

    context "when account_id is present" do
      it "instantiates a new Myfinance::Http object" do
        expect(Myfinance::Http).to receive(:new).with("abc", 123)
        Myfinance::Client.new("abc", 123)
      end
    end
  end

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") { expect(subject.authenticated?).to be_truthy }
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") { expect(subject.authenticated?).to be_falsey }
      end
    end
  end

  include_examples :resource, :entities, Myfinance::Resources::Entity
  include_examples :resource, :payable_accounts, Myfinance::Resources::PayableAccount
  include_examples :resource, :receivable_accounts, Myfinance::Resources::ReceivableAccount
  include_examples :resource, :attachments, Myfinance::Resources::Attachment
  include_examples :resource, :classification_centers, Myfinance::Resources::ClassificationCenter
  include_examples :resource, :categories, Myfinance::Resources::Category
  include_examples :resource, :accounts, Myfinance::Resources::Account
  include_examples :resource, :financial_transactions, Myfinance::Resources::FinancialTransaction
  include_examples :resource, :deposit_accounts, Myfinance::Resources::DepositAccount
  include_examples :resource, :people, Myfinance::Resources::Person
  include_examples :resource, :webhooks, Myfinance::Resources::Webhook
  include_examples :resource, :taxes, Myfinance::Resources::Tax
  include_examples :resource, :credit_cards, Myfinance::Resources::CreditCard
  include_examples :resource, :credit_card_transactions, Myfinance::Resources::CreditCardTransaction
  include_examples :resource, :reconciles, Myfinance::Resources::Reconcile
  include_examples :resource, :sales, Myfinance::Resources::Sale
  include_examples :resource, :sale_accounts, Myfinance::Resources::SaleAccount
  include_examples :resource, :sale_rules, Myfinance::Resources::SaleRule
  include_examples :resource, :custom_classifiers, Myfinance::Resources::CustomClassifier
end
