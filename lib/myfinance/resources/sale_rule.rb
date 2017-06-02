module Myfinance
  module Resources
    class SaleRule < Base
      def find_all(sale_account_id)
        http.get("/sale_accounts/#{sale_account_id}/rules", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      def find(sale_account_id, rule_id)
        path = "/sale_accounts/#{sale_account_id}/rules/#{rule_id}"
        http.get(path, body: {}) do |response|
          respond_with_object(response, "sale_rule")
        end
      end

      def create(sale_account_id, params = {})
        path = "/sale_accounts/#{sale_account_id}/rules/"
        http.post(path, body: { sale_rule: params }) do |response|
          respond_with_object(response, "sale_rule")
        end
      end

      def update(sale_account_id, rule_id, params = {})
        path = "/sale_accounts/#{sale_account_id}/rules/#{rule_id}"
        http.put(path, body: { sale_rule: params }) do |response|
          respond_with_object(response, "sale_rule")
        end
      end

      def destroy(sale_account_id, rule_id, params = {})
        path = "/sale_accounts/#{sale_account_id}/rules/#{rule_id}"
        http.delete(path, body: { sale_rule: params }) do |response|
          response
        end
      end
    end
  end
end
