require "spec_helper"

describe Myfinance::Entities::SaleAccount do
  it_behaves_like "entity_attributes", %i[
    id
    name
    entity_id
    description
    provider
    payment_methods
    category_id
    person_id
    classification_center_id
    custom_classifications
    created_at
    updated_at
  ]
end
