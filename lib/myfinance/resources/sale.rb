module Myfinance
  module Resources
    class Sale < Base
      def find_all(entity_id)
        http.get("/entities/#{entity_id}/sales", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(entity_id, sale_id)
        path = "/entities/#{entity_id}/sales/#{sale_id}"
        http.get(path, body: {}) do |response|
          respond_with_object(response, "sale")
        end
      end

      def create(entity_id, params = {})
        path = "/entities/#{entity_id}/sales/"
        http.post(path, body: { sale: params }) do |response|
          respond_with_object(response, "sale")
        end
      end

      def update(entity_id, sale_id, params = {})
        path = "/entities/#{entity_id}/sales/#{sale_id}"
        http.put(path, body: { sale: params }) do |response|
          respond_with_object(response, "sale")
        end
      end

      def destroy(entity_id, sale_id, params = {})
        path = "/entities/#{entity_id}/sales/#{sale_id}"
        http.delete(path, body: { sale: params }) do |response|
          response
        end
      end
    end
  end
end
