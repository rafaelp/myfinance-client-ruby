module Myfinance
  module Entities
    class BankStatement < Base
      attribute :id, Integer
      attribute :deposit_account_id, Integer
      attribute :file_file_name, String
      attribute :future_items_ignored_count, Integer
      attribute :amount_zero_items_ignored_count, Integer
      attribute :invalid_date_items_ignored_count, Integer
      attribute :event, Hash

      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
