module Myfinance
  module Entities
    #
    # A wrapper to Myfinance custom_classifiers collection
    #
    class CustomClassifierValueCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(
            Myfinance::Entities::CustomClassifierValue.new(attributes["custom_classifier_value"])
          )
        end
      end
    end
  end
end
