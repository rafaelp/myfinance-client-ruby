module Myfinance
  module Entities
    class CreditCard < Base
      attribute :id, Integer
      attribute :entity_id, Integer
      attribute :person_id, Integer
      attribute :classification_center_id, Integer
      attribute :category_id, Integer
      attribute :closing_day, Integer
      attribute :expiration_day, Integer
      attribute :name, String
      attribute :flag, String
      attribute :flag_image_url, String
      attribute :observation, String
    end
  end
end
