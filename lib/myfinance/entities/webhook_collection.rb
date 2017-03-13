module Myfinance
  module Entities
    #
    # A wrapper to Myfinance webhook collection
    #
    class WebhookCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::Webhook.new(attributes["webhook"])
          )
        end
      end
    end
  end
end