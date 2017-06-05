module Myfinance
  module Entities
    class SaleRule < Base
      attribute :id
      attribute :sale_account_id
      attribute :issuer
      attribute :payment_method
      attribute :fee_percentage
      attribute :fixed_fee_amount
      attribute :days_to_liquidation
      attribute :weekdays
      attribute :created_at
      attribute :updated_at
    end
  end
end
