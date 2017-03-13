require 'spec_helper'

describe Myfinance::Entities::Category do
  subject { described_class.new({}) }

  it_behaves_like 'entity_attributes', [
                    :account_id, :cost, :created_at, :excel_import_id,
                    :force_destroy, :full_name, :guid, :id, :imported_from_sync,
                    :interested_users_ids, :modified_by_sync, :name, :parent_id,
                    :revenue, :updated_at, :use_count
                  ]
end
