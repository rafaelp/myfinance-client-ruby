module Myfinance
  module Entities
    #
    # A wrapper to Myfinance entities collection
    #
    class AccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::Account.new(attributes["account"])
          )
        end
      end
    end
  end
end
