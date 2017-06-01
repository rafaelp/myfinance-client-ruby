require "spec_helper"

describe Myfinance::Entities::SaleCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Sale
end
