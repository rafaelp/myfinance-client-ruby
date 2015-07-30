require 'spec_helper'

describe Myfinance::Entities::Entity do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :name, :account_id,:charging_uuid, :created_at,
    :default_in_menu, :deleted_at, :federation_subscription_number,
    :imported_from_sync_at, :updated_at
  ]
end
