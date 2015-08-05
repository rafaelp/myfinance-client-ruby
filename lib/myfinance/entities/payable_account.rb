module Myfinance
  module Entities
    class PayableAccount < Base
      attribute :id, Integer
      attribute :entity_id, Integer
      attribute :status, Integer
      attribute :status_name, String
      attribute :due_date, Date
      attribute :occurred_at, Date
      attribute :amount, Float
      attribute :ticket_amount, Float
      attribute :interest_amount, Float
      attribute :discount_amount, Float
      attribute :total_amount, Float
      attribute :description, String
      attribute :document, String
      attribute :document_emission_date, Date
      attribute :observation, String
      attribute :remind, Boolean
      attribute :reminded_at, Date
      attribute :income_tax_relevant, Boolean
      attribute :category_id, Integer
      attribute :classification_center_id, Integer
      attribute :expected_deposit_account_id, Integer
      attribute :recurrece_id, Integer
      attribute :person_id, Integer
      attribute :recurrent, Boolean
      attribute :parcelled, Boolean
      attribute :recurrence_id, Integer
      attribute :recurrence_period, String
      attribute :number_of_parcels, Integer
      attribute :current_parcel, Integer
      attribute :competency_month, String
      attribute :financial_account_taxes_attributes, Array[Hash]
      attribute :reconciliations, Hash[String => Array]
      attribute :links, Array[Hash[String => String]]
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
