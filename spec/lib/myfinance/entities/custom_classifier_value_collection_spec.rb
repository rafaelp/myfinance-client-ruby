require "spec_helper"

describe Myfinance::Entities::CustomClassifierValueCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::CustomClassifierValue
end
