module Myfinance
  module Entities
    class Person < Base
      attribute :account_id, Integer
      attribute :address, String
      attribute :address_number, Integer
      attribute :city, String
      attribute :complement, String
      attribute :country, String
      attribute :created_at, DateTime
      attribute :customer, Boolean
      attribute :email, String
      attribute :excel_import_id, Integer
      attribute :febraban_favored_code, Integer
      attribute :febraban_name, String
      attribute :federation_subscription_number, String 
      attribute :federation_subscription_number_only_numbers, Integer
      attribute :federation_subscription_type_id, Integer
      attribute :force_destroy, Boolean
      attribute :guid, String
      attribute :id, Integer
      attribute :imported_from_sync, Boolean
      attribute :interested_users_ids, Array
      attribute :modified_by_sync, Boolean
      attribute :name, String
      attribute :neighborhood, String 
      attribute :note, String
      attribute :person_type, String 
      attribute :phone, String
      attribute :site, String
      attribute :state, String
      attribute :supplier, Boolean
      attribute :updated_at, DateTime
      attribute :use_count, Integer
      attribute :zip_code, String
    end
  end
end
