module Myfinance
  module Entities
    class SaleRuleCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::SaleRule.new(attributes["sale_rule"])
          )
        end
      end
    end
  end
end
