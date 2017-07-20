require "spec_helper"

describe Myfinance::Resources::CustomClassifier, vcr: true do
  let(:entity_klass) { Myfinance::Entities::CustomClassifier }

  describe "#find_all" do
    context "with success" do
      subject { client.custom_classifiers.find_all }

      it "show all custom_classifiers successfully" do
        expect(subject.class).to eq(Myfinance::Entities::CustomClassifierCollection)
        expect(subject.collection.first.class).to eq(entity_klass)
        expect(subject.collection.first.name).to eq("Produto")
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.custom_classifiers.find(20) }

      it "returns a custom_classifier successfully" do
        expect(subject.class).to eql(entity_klass)
        expect(subject.id).to eq(20)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect { client.custom_classifiers.find(88_888_888) }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) { { name: "Classificador 42" } }

    context "with success" do
      it "creates a custom_classifier successfully" do
        result = client.custom_classifiers.create(params)
        expect(result).to be_a(entity_klass)
        expect(result.name).to eql("Classificador 42")
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect { client.custom_classifiers.create(name: {}) }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a custom_classifier successfully" do
        expect(client.custom_classifiers.update(25, name: "Classificador alterado")).to be_a(entity_klass)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect { client.custom_classifiers.update(88_888_888, {}) }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end

  describe "#destroy" do
    let(:params) { { name: "Nome qualquer" } }
    context "with success" do
      it "destroy a custom_classifier successfully" do
        cc_id = client.custom_classifiers.create(params).id
        expect(client.custom_classifiers.destroy(cc_id)).to be_truthy
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect { client.custom_classifiers.destroy(88_888_888) }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end
end
