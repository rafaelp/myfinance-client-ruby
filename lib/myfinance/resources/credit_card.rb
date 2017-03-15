module Myfinance
  module Resources
    class CreditCard < Base
      def find_all(entity_id)
        http.get(path(entity_id), body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(entity_id, id)
        cc_path = path(entity_id) + "/#{id}"
        http.get(cc_path, body: {}) do |response|
          respond_with_object(response, "credit_card")
        end
      end

      def create(entity_id, params = {})
        body = { credit_card: params }
        http.post(path(entity_id), body: body) do |response|
          respond_with_object(response, "credit_card")
        end
      end

      def update(entity_id, id, params = {})
        cc_path = path(entity_id) + "/#{id}"
        body = { credit_card: params }
        http.put(cc_path, body: body) do |response|
          respond_with_object(response, "credit_card")
        end
      end

      def destroy(entity_id, id)
        cc_path = path(entity_id) + "/#{id}"
        http.delete(cc_path, body: {}) do |response|
          response
        end
      end


      private

      def path(entity_id)
        "/entities/#{entity_id}/credit_cards"
      end
    end
  end
end
