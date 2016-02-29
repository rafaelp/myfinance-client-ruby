module Myfinance
  module Resources
    class Attachment < Base
      #
      # List all attachments of the entity
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/attachments#get_index
      #
      def find_all(entity_id, params = { page: 1 })
        http.get("/entities/#{entity_id}/attachments", body: params) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Show attachment details
      #
      # [API]
      #   Method: <tt>GET /entities/:entity_id/attachments/:id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/attachments#get_show
      #
      def find(entity_id, attachment_id)
        http.get("/entities/#{entity_id}/attachments/#{attachment_id}") do |response|
          respond_with_object(response, 'attachment')
        end
      end
    end
  end
end
