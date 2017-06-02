module Myfinance
  module Entities
    class SaleRule < Base
      attribute :issuer
      attribute :payment_method
      attribute :fee_percentage
      attribute :days_to_liquidation
      attribute :sale_account_id
      attribute :week_day
    end
  end
end
