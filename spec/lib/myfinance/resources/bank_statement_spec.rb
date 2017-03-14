require "spec_helper"

describe Myfinance::Resources::BankStatement, vcr: true do
  let(:entity_id) { 3798 }
  let(:file) { File.open("spec/support/bank_statements/extrato.ofx", "r") }
end
