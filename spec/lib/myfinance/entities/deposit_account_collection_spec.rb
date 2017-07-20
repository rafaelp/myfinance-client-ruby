require "spec_helper"

describe Myfinance::Entities::DepositAccountCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::DepositAccount
end
