require 'spec_helper'

describe Myfinance::Resources::Category, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Category }

  describe "#find_all" do
    context "with success" do
      subject { client.categories.find_all }

      it "show all categories successfully" do
        expect(subject.class).to eq(Myfinance::Entities::CategoryCollection)
        expect(subject.collection.first.class).to eq(entity_klass)
        expect(subject.collection.first.full_name).to eq("Alimentação")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.categories.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(401)
        end
      end
    end
  end

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
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.categories.create({})
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
    end
  end
end
