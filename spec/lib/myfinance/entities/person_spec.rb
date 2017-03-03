require 'spec_helper'

describe Myfinance::Entities::Person do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
                    :account_id, :address, :address_number, :city, :complement,
                    :country, :created_at, :customer, :email, :excel_import_id,
                    :febraban_favored_code, :febraban_name,
                    :federation_subscription_number,
                    :federation_subscription_number_only_numbers,
                    :federation_subscription_type_id, :force_destroy, :guid,
                    :id, :imported_from_sync, :interested_users_ids,
                    :modified_by_sync, :name, :neighborhood, :note,
                    :person_type, :phone, :site, :state, :supplier, :updated_at,
                    :use_count, :zip_code
                  ]
end