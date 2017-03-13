module Myfinance
  module Entities
    class ClassificationCenter < Base
      attribute :cost_center, Boolean
      attribute :created_at, DateTime
      attribute :entity_id, Integer
      attribute :excel_import_id, Integer
      attribute :id, Integer
      attribute :name, String
      attribute :revenue_center, Boolean
      attribute :updated_at, DateTime
      attribute :use_count, Integer
    end
  end
end
