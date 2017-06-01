require "spec_helper"

describe Myfinance::Entities::Sale do
  it_behaves_like "entity_attributes", %i[
    id
    nominal_amount
    receivable_amount
    fixed_fee_amount
    fee_percentage
    fee_percentage_amount
    issuer
    payment_method
    status
    summary
    description
    observation
    category_id
    classification_center_id
    person_id
    days_to_liquidation
    sale_account_id
    financial_account_id
    liquidation_week_day
    liquidation_date
    liquidated_at
    occurred_at
    created_at
    updated_at
    custom_classifications
  ]
end
