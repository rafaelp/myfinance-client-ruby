require "spec_helper"

describe Myfinance::Entities::SaleAccount do
  it_behaves_like "entity_attributes", %i[
    id
    name
    entity_id
    description
    provider
    created_at
    updated_at
  ]
end
