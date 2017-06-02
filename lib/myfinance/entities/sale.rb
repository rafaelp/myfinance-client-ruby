module Myfinance
  module Entities
    class Sale < Base
      attribute :id
      attribute :nominal_amount
      attribute :receivable_amount
      attribute :fixed_fee_amount
      attribute :fee_percentage
      attribute :fee_percentage_amount
      attribute :issuer
      attribute :payment_method
      attribute :status
      attribute :summary
      attribute :description
      attribute :observation
      attribute :category_id
      attribute :classification_center_id
      attribute :person_id
      attribute :days_to_liquidation
      attribute :sale_account_id
      attribute :financial_account_id
      attribute :liquidation_week_day
      attribute :estimated_liquidated_at
      attribute :liquidated_at
      attribute :occurred_at
      attribute :created_at
      attribute :updated_at
      attribute :custom_classifications
    end
  end
end
