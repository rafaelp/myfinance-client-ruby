module Myfinance
  module Entities
    class Account < Base
      attribute :beta, Boolean
      attribute :canceled_at, DateTime
      attribute :cancellation_reason, String
      attribute :charging_uuid, String
      attribute :created_at, DateTime
      attribute :default_currency_id, Integer
      attribute :ecommerce_response, String
      attribute :expires_on, Date
      attribute :id, Integer
      attribute :invite, String
      attribute :is_trial, Boolean
      attribute :name, String
      attribute :owner_id, Integer
      attribute :payment_method, String
      attribute :plan_slug, String
      attribute :referral_code, String
      attribute :referrer_id, Integer
      attribute :updated_at, DateTime
      attribute :uuid, String
      attribute :waiting_payment, Boolean
    end
  end
end
