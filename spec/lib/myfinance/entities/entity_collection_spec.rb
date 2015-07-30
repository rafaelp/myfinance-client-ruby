require 'spec_helper'

describe Myfinance::Entities::EntityCollection do
  let(:response) { double(headers: { "Link" => "<https://sandbox.myfinance.com.br/entities?page=3>; rel=next, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=prev, <http://https://sandbox.myfinance.com.br/entities?page=3>; rel=last, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=first" },
                          body: "[{\"entity\":{\"account_id\":3613,\"charging_uuid\":null,\"created_at\":\"2015-07-29T11:04:45-03:00\",\"default_in_menu\":true,\"deleted_at\":null,\"federation_subscription_number\":\"\",\"force_destroy\":false,\"id\":3798,\"imported_from_sync_at\":null,\"name\":\"Minhas Finan\\u00e7as\",\"updated_at\":\"2015-07-29T14:30:36-03:00\"}}]",
                          parsed_body: [{"entity" => {"account_id" => 3613,"charging_uuid" => nil,"created_at" => "2015-07-29T11:04:45-03:00","default_in_menu" => true,"deleted_at" => nil,"federation_subscription_number" => "","force_destroy" => false,"id" => 3798,"imported_from_sync_at" => nil,"name" => "Minhas Finan\\u00e7as","updated_at" => "2015-07-29T14:30:36-03:00"} }]) }

  subject { Myfinance::Entities::EntityCollection.new(response) }

  describe '#build' do
    it 'returns order collection' do
      expect(subject.build.class).to eq(Myfinance::Entities::EntityCollection)
    end

    it "returns orders" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(Myfinance::Entities::Entity)
    end
  end
end
