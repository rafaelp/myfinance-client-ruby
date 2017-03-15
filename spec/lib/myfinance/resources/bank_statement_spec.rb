require "spec_helper"

describe Myfinance::Resources::BankStatement, vcr: true do
  let(:entity_id) { 3798 }
  let(:deposit_account_id) { 14268 }
  let(:bank_statement_id) { 18213 }
  let(:bank_statement_klass) { Myfinance::Entities::BankStatement }
  let(:file) { File.open("spec/support/bank_statements/extrato.ofx", "r") }


  describe "#import" do
    subject { client.bank_statements.import(entity_id, deposit_account_id, file) }

    it "" do
    end
  end

  describe "#status" do
    subject { client.bank_statements.status(entity_id, deposit_account_id, bank_statement_id) }

    it "returns a BankStatement" do
      expect(subject).to be_a(bank_statement_klass)
    end
  end
end
