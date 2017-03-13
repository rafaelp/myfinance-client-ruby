require "spec_helper"

describe Myfinance::Entities::DepositAccount do
  it_behaves_like "entity_attributes", [
                    :archive, :bank_account_id, :created_at, :currency_id,
                    :deposit_account_type_id, :description, :entity_id,
                    :force_destroy, :id, :imported_from_sync, :initial_balance,
                    :last_transaction_date, :name, :sync_response, :updated_at,
                    :calculated_balance, :logo_image_url, :links
                  ]
end
