require "spec_helper"

describe Myfinance::Entities::SaleAccount do
  it_behaves_like "entity_attributes", %i[
    provider
    name
    description
    entity_id
  ]
end
