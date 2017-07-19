require "spec_helper"

describe Myfinance::Entities::TaxCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Tax
end
