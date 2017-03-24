require "spec_helper"

describe Myfinance::Resources::BankStatement, vcr: true do
  let(:entity_id) { 3798 }
  let(:deposit_account_id) { 14268 }
  let(:bank_statement_id) { 18213 }
  let(:bank_statement_klass) { Myfinance::Entities::BankStatement }
  let(:file) { File.open("spec/support/bank_statements/#{file_name}", "r") }
  let(:file_name) { "extrato.ofx" }
  let(:request_error) { Myfinance::RequestError }

  describe "#import" do
    subject { client.bank_statements.import(entity_id, deposit_account_id, file) }

    it "returns a BankStatement" do
      expect(subject).to be_a(bank_statement_klass)
    end

    it "returns imported BankStatement" do
      expect(subject.file_file_name).to eq(file_name)
      expect(subject.created_at).not_to eq(nil)
    end

    context "with invalid file" do
      subject { client.bank_statements.import(entity_id, deposit_account_id, "diretorio/que/nao/existe/arquivo.ofx") }

      it "returns 500 error code" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(500)
        end
      end
    end
  end

  describe "#status" do
    subject { client.bank_statements.status(entity_id, deposit_account_id, bank_statement_id) }

    it "returns a BankStatement" do
      expect(subject).to be_a(bank_statement_klass)
    end

    context "when invalid ID" do
      subject { client.bank_statements.status(entity_id, deposit_account_id, nil) }

      it "returns 404 not found error" do
        expect { subject }.to raise_error(request_error) do |e|
          expect(e.code).to eq(404)
          expect(e.message).to eq("Not Found")
        end
      end
    end
  end
end
