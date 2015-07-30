require 'spec_helper'

describe Myfinance::Entities::Collection do
  let(:response) { double(headers: {"Link" => "<https://sandbox.myfinance.com.br/entities?page=3>; rel=next, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=prev, <http://https://sandbox.myfinance.com.br/entities?page=3>; rel=last, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=first" },
                          body: "[{\"entity\":{\"account_id\":3613,\"charging_uuid\":null,\"created_at\":\"2015-07-29T11:04:45-03:00\",\"default_in_menu\":true,\"deleted_at\":null,\"federation_subscription_number\":\"\",\"force_destroy\":false,\"id\":3798,\"imported_from_sync_at\":null,\"name\":\"Minhas Finan\\u00e7as\",\"updated_at\":\"2015-07-29T14:30:36-03:00\"}}]") }

  subject { described_class.new(response) }

  describe '#build' do
    it 'raises NotImplementedError' do
      expect { subject.build }.to raise_error(NotImplementedError)
    end
  end

  describe '#next_page' do
    it 'returns next page (3)' do
      expect(subject.next_page).to eq(3)
    end

    context 'when there is no next page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.next_page).to be_nil
      end
    end
  end

  describe '#last_page' do
    it 'returns last page (3)' do
      expect(subject.last_page).to eq(3)
    end

    context 'when there is no last page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.last_page).to be_nil
      end
    end
  end

  describe '#previous_page' do
    it 'returns previous page (3)' do
      expect(subject.previous_page).to eq(1)
    end

    context 'when there is no previous page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.previous_page).to be_nil
      end
    end
  end

  describe '#first_page' do
    it 'returns first page (3)' do
      expect(subject.first_page).to eq(1)
    end

    context 'when there is no first page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.first_page).to be_nil
      end
    end
  end
end
