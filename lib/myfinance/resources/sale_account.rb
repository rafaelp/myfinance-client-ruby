module Myfinance
  module Resources
    class SaleAccount < Base
      def find_all
        http.get("/sale_accounts", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(sale_account_id)
        path = "/sale_accounts/#{sale_account_id}"
        http.get(path, body: {}) do |response|
          respond_with_object(response, "sale_account")
        end
      end

      def create(params = {})
        path = "/sale_accounts/"
        http.post(path, body: { sale_account: params }) do |response|
          respond_with_object(response, "sale_account")
        end
      end

      def update(sale_account_id, params = {})
        path = "/sale_accounts/#{sale_account_id}"
        http.put(path, body: { sale_account: params }) do |response|
          respond_with_object(response, "sale_account")
        end
      end

      def destroy(sale_account_id, params = {})
        path = "/sale_accounts/#{sale_account_id}"
        http.delete(path, body: { sale_account: params }) do |response|
          response
        end
      end
    end
  end
end
