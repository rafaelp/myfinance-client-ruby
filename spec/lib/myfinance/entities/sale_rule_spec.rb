require "spec_helper"

describe Myfinance::Entities::SaleRule do
  it_behaves_like "entity_attributes", %i[
    issuer
    payment_method
    fee_percentage
    days_to_liquidation
    sale_account_id
    week_day
  ]
end
