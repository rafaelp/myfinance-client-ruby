module Myfinance
  module Entities
    class CustomClassifierValue < Base
      attribute :custom_classifier_id, Integer
      attribute :id, Integer
      attribute :value, String
      attribute :updated_at, DateTime
      attribute :created_at, DateTime
    end
  end
end
