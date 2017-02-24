require 'spec_helper'

describe Myfinance::Resources::Category, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Category }

  describe "#create" do
    let(:params) { { name: "Category 1" } }

    context "with success" do
      it "creates a category successfully" do
        result = client.categories.create(params)

        expect(result).to be_a(entity_klass)
        expect(result.name).to eql("Category 1")
      end

    end

    context "with error" do 
      it "creates with error" do
        expect{
          client.categories.create({})
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(422)
        end
      end
    end
  end
end
