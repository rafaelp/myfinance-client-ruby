require "spec_helper"

describe Myfinance::Entities::CreditCardTransactionCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::CreditCardTransaction
end
