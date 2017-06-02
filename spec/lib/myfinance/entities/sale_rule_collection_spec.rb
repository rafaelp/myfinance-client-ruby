require "spec_helper"

describe Myfinance::Entities::SaleRuleCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::SaleRule
end
