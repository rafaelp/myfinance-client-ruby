require "spec_helper"

describe Myfinance::Entities::SaleRule do
  it_behaves_like "entity_attributes", %i[
    id
    sale_account_id
    issuer
    payment_method
    fee_percentage
    fixed_fee_amount
    days_to_liquidation
    weekdays
    created_at
    updated_at
  ]
end
