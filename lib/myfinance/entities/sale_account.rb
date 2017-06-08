module Myfinance
  module Entities
    class SaleAccount < Base
      attribute :id
      attribute :name
      attribute :entity_id
      attribute :description
      attribute :provider
      attribute :payment_methods
      attribute :category_id
      attribute :person_id
      attribute :classification_center_id
      attribute :custom_classifications
      attribute :created_at
      attribute :updated_at
    end
  end
end
