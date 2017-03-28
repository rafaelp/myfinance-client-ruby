require "spec_helper"

describe Myfinance::Resources::ClassificationCenter, vcr: true do
  let(:entity_klass) { Myfinance::Entities::ClassificationCenter }
  let(:page) { 2 }

  let(:entity_collection) do
    Myfinance::Entities::ClassificationCenterCollection
  end

  describe "#find_all" do
    context "when success" do
      subject { client.classification_centers.find_all }

      it "show all classifications center" do
        expect(subject).to be_a(entity_collection)
        expect(subject.collection.first).to be_a(entity_klass)
        expect(subject.collection.first.name).to eq("Centro de Custo Tal")
      end

      context "with params" do
        let(:params) { { entity_id_equals: 3798 } }

        it "find by name successfully" do
          params[:name_equals] = "Centro de Custo Tal"
          outcome = client.classification_centers.find_all(params)

          expect(outcome).to be_a(entity_collection)
          expect(outcome.collection.first).to be_a(entity_klass)
          expect(outcome.collection.first.name).to eq("Centro de Custo Tal")
        end

        it "find with special characters" do
          params[:name_equals] = "Socialização 2"
          outcome = client.classification_centers.find_all(params)

          expect(outcome).to be_a(entity_collection)
          expect(outcome.collection.first).to be_a(entity_klass)
          expect(outcome.collection.first.name).to eq("Socialização 2")
        end

        it "returns a empty classification center successfully" do
          params[:name_equals] = "Any"
          outcome = client.classification_centers.find_all(params)

          expect(outcome).to be_a(entity_collection)
          expect(outcome.collection.first).to be_falsy
        end
      end

      context "when paging" do
        let(:search_params) { { page: page, entity_id_equals: 3798, name_contains: "Centro" } }
        subject { client.classification_centers.find_all(search_params) }

        it "returns paginated url" do
          url = subject.response.request.base_url
          expect(url).to include("page=#{page}")
        end
      end
    end

    context "when error" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.classification_centers.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "when success" do
      subject { client.classification_centers.find(17982) }

      it "show a classification center successfully" do
        expect(subject).to be_a(entity_klass)
        expect(subject.name).to eq("Centro de Custo Tal")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.classification_centers.find(888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    context "when success" do
      let(:params) do
        {
          cost_center: true,
          entity_id: 3798,
          name: "Centro de custo 1",
          revenu_center: false,
          use_count: 0
        }
      end

      it "creates a classification center" do
        result = client.classification_centers.create(params)
        expect(result).to be_a(entity_klass)
        expect(result.name).to eq("Centro de custo 1")
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.classification_centers.create({})
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "when success" do
      let(:params) { { name: "Centro de custo updated" } }

      it "updates a classification center successfully" do
        expect(
          client.classification_centers.update(18744, params)
        ).to be_a(entity_klass)
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.classification_centers.update(18744, { name: "" })
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#delete" do
    context "when success" do
      it "destroy a classification center successfully" do
        expect(client.classification_centers.destroy(18744)).to be_truthy
      end
    end

    context "when error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.classification_centers.destroy(888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end
