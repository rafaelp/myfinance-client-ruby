require "spec_helper"

describe Myfinance::Entities::ClassificationCenter do
  it_behaves_like "entity_attributes", [
                    :cost_center, :created_at, :entity_id, :excel_import_id,
                    :id, :name, :revenue_center, :updated_at, :use_count
                  ]
end
