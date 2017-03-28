require 'spec_helper'

describe Myfinance::Resources::Category, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Category }

  describe "#find_all" do
    context "with success" do
      subject { client.categories.find_all }

      it "show all categories successfully" do
        expect(subject.class).to eq(Myfinance::Entities::CategoryCollection)
        expect(subject.collection.first.class).to eq(entity_klass)
        expect(subject.collection.first.full_name).to eq("Moradia / Água e Esgoto")
      end
    end

    it "find categories by attributes" do
      params = { name: "Alimentação" }
      result = client.categories.find_all(params)

      expect(result).to be_a(Myfinance::Entities::CategoryCollection)
      expect(result.collection.first).to be_a(entity_klass)
      expect(result.collection.first.name).to eql("Alimentação")
    end
  end

  context "when error" do
    let(:client) { Myfinance.client("") }

    it "raises Myfinance::RequestError with 401 status code" do
      expect { client.categories.find_all({}) }.to raise_error(Myfinance::RequestError) do |error|
        expect(error.code).to eql(401)
      end
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

  describe "#find" do
    context "with success" do
      subject { client.categories.find(532323) }

      it "returns a category successfully" do
        expect(subject.class).to eql(entity_klass)
        expect(subject.id).to eql(532323)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.categories.find(88888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) { { name: "Categoria 42 do Marvin" } }

    context "with success" do
      it "creates a category successfully" do
        result = client.categories.create(params)
        expect(result).to be_a(entity_klass)
        expect(result.name).to eql("Categoria 42 do Marvin")
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
      it "updates a category successfully" do
        expect(
          client.categories.update(548083, { name: "Category updated" })
        ).to be_a(entity_klass)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.categories.update(88888888, {})
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end

      it "raises Myfinance::RequestError with 422 status core" do
        expect { client.categories.update(548083, { name: "" }) }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.categories.destroy(532350)).to be_truthy
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.categories.destroy(88888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end
end
