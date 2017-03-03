require 'spec_helper'

describe Myfinance::Resources::Person, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Person }

  describe "#find_all" do
    context "with success" do
      subject { client.people.find_all }

      it "show all people successfully" do
        expect(subject).to be_a(Myfinance::Entities::PersonCollection)
        expect(subject.collection.first).to be_a(entity_klass)
        expect(subject.collection.first.name).to eq("Myfreecomm")
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client("") }

      it "raises Myfinance::RequestError with 401 status code" do
        expect {
          client.people.find_all
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end
end
