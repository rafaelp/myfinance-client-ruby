require "spec_helper"

describe Myfinance::Resources::CustomClassifierValue, vcr: true do
  let(:entity_klass) { Myfinance::Entities::CustomClassifierValue }
  let(:custom_classifier_id) { 20 }
  let(:custom_classifier_value_id) { 36 }

  describe "#find_all" do
    context "with success" do
      subject { client.custom_classifier_values.find_all(custom_classifier_id) }

      it "show all custom_classifier_values successfully" do
        expect(subject.class).to eq(Myfinance::Entities::CustomClassifierValueCollection)
        expect(subject.collection.first.class).to eq(entity_klass)
        expect(subject.collection.first.value).to eq("Classificador 42")
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.custom_classifier_values.find(custom_classifier_id, custom_classifier_value_id) }

      it "returns a custom_classifier_value successfully" do
        expect(subject.class).to eql(entity_klass)
        expect(subject.id).to eq(custom_classifier_value_id)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expectation = expect do
          client.custom_classifier_values.find(custom_classifier_id, 88_888_888)
        end

        expectation.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) { { value: "Valor 42" } }

    context "with success" do
      it "creates a custom_classifier_value successfully" do
        result = client.custom_classifier_values.create(custom_classifier_id, params)
        expect(result).to be_a(entity_klass)
        expect(result.value).to eql("Valor 42")
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expectation = expect do
          client.custom_classifier_values.create(custom_classifier_id, value: {})
        end

        expectation.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a custom_classifier_value successfully" do
        updated = client.custom_classifier_values.update(
          custom_classifier_id, custom_classifier_value_id, value: "Valor alterado"
        )
        expect(updated).to be_a(entity_klass)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expectation = expect do
          client.custom_classifier_values.update(custom_classifier_id, 88_888_888, {})
        end

        expectation.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end

  describe "#destroy" do
    let(:params) { { value: "Nome qualquer" } }
    context "with success" do
      it "destroy a custom_classifier_value successfully" do
        cc_id = client.custom_classifier_values.create(custom_classifier_id, params).id
        expect(client.custom_classifier_values.destroy(custom_classifier_id, cc_id)).to be_truthy
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expectation = expect do
          client.custom_classifier_values.destroy(custom_classifier_id, 88_888_888)
        end

        expectation.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eql(404)
        end
      end
    end
  end
end
