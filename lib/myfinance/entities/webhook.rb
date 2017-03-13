module Myfinance
  module Entities
    class Webhook < Base
      attribute :account_id, Integer
      attribute :created_at, DateTime
      attribute :description, String
      attribute :entity_id, Integer
      attribute :healthy_check_code, String
      attribute :id, Integer
      attribute :updated_at, DateTime
      attribute :url, String
    end
  end
end
