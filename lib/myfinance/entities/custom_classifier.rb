module Myfinance
  module Entities
    class CustomClassifier < Base
      attribute :account_id, Integer
      attribute :id, Integer
      attribute :name, String
      attribute :updated_at, DateTime
      attribute :created_at, DateTime
    end
  end
end
