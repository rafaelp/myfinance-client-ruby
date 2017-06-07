module Myfinance
  module Entities
    class SaleAccount < Base
      attribute :id
      attribute :name
      attribute :entity_id
      attribute :description
      attribute :provider
      attribute :created_at
      attribute :updated_at
    end
  end
end
