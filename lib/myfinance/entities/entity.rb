module Myfinance
  module Entities
    class Entity < Base
      attribute :id, Integer
      attribute :name, String
      attribute :account_id, Integer
      attribute :charging_uuid, String
      attribute :created_at, DateTime
      attribute :default_in_menu, Boolean
      attribute :deleted_at, DateTime
      attribute :federation_subscription_number, String
      attribute :imported_from_sync_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
