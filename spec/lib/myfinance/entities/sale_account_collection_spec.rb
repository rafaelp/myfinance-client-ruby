require "spec_helper"

describe Myfinance::Entities::SaleAccountCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::SaleAccount
end
