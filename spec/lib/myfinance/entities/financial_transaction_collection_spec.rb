require "spec_helper"

describe Myfinance::Entities::FinancialTransactionCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::FinancialTransaction
end
