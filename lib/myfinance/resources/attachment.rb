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

      #
      # Create an attachment
      #
      # [API]
      #   Method: <tt>POST /entities/:entity_id/attachments</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/attachments#post_create
      #
      def create(entity_id, file, params = {})
        params.merge!(attachment: file)
        http.post("/entities/#{entity_id}/attachments", { body: { attachment: params }, multipart: true }) do |response|
          respond_with_object(response, 'attachment')
        end
      end

      #
      # Destroy an attachment
      #
      # [API]
      #   Method: <tt>DELETE /entities/:entity_id/attachments/:attachment_id</tt>
      #
      #   Documentation: https://sandbox.myfinance.com.br/docs/api/attachments#delete_destroy
      #
      def destroy(entity_id, attachment_id)
        http.delete("/entities/#{entity_id}/attachments/#{attachment_id}")
      end
    end
  end
end
