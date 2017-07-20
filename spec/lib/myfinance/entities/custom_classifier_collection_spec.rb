require "spec_helper"

describe Myfinance::Entities::CustomClassifierCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::CustomClassifier
end
