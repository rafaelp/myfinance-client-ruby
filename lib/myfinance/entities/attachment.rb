module Myfinance
  module Entities
    class Attachment < Base
      [:id, :entity_id, :attachment_file_size].each { |k| attribute k, Integer }

      [:title, :attachment_file_name, :download_url,
       :attachment_content_type].each { |k| attribute k, String }

      [:created_at, :updated_at].each { |k| attribute k, DateTime }

      attribute :attachables, Array[Hash]
      attribute :links, Array[Hash[String => String]]
    end
  end
end
