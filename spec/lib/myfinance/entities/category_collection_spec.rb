require "spec_helper"

describe Myfinance::Entities::CategoryCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Category
end
