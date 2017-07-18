module Myfinance
  module Entities
    #
    # A wrapper to Myfinance custom_classifiers collection
    #
    class CustomClassifierCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::CustomClassifier.new(attributes["custom_classifier"])
          )
        end
      end
    end
  end
end
