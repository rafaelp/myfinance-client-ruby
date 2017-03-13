module Myfinance
  module Entities
    #
    # a wrapper to Myfinance deposit account collection
    #
    class DepositAccountCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Myfinance::Entities::DepositAccount.new(
                            attributes["deposit_account"])
                          )
        end
      end
    end
  end
end
