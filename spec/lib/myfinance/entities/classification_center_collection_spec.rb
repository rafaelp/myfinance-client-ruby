require "spec_helper"

describe Myfinance::Entities::ClassificationCenterCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::ClassificationCenter
end
