require "spec_helper"

describe Myfinance::Entities::CustomClassifier do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:account_id, :created_at, :id, :name, :updated_at]
end
