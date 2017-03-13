require "spec_helper"

describe Myfinance::Entities::Account do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
                    :beta, :canceled_at, :cancellation_reason, :charging_uuid,
                    :created_at, :default_currency_id, :ecommerce_response,
                    :expires_on, :id, :invite, :is_trial, :name, :owner_id,
                    :payment_method, :plan_slug, :referral_code, :referrer_id,
                    :updated_at, :uuid, :waiting_payment
                  ]
end
