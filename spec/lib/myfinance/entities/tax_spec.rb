require "spec_helper"

describe Myfinance::Entities::Tax do
  it_behaves_like "entity_attributes", [:created_at, :id, :name, :updated_at]
end
