require "spec_helper"

describe Myfinance::Entities::CustomClassifierValue do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", %i[custom_classifier_id created_at id value updated_at]
end
