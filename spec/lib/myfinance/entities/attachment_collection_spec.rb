require 'spec_helper'

describe Myfinance::Entities::AttachmentCollection do
  let(:response) { double(headers: { "Link" => "<https://sandbox.myfinance.com.br/entities?page=3>; rel=next, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=prev, <http://https://sandbox.myfinance.com.br/entities?page=3>; rel=last, <http://https://sandbox.myfinance.com.br/entities?page=1>; rel=first" },
                          parsed_body: [{"attachment" => {"id" => 12,"entity_id" => 1,"title" => "","attachment_file_name" => "extratoPoup.ofx","attachment_content_type" => "application/octet-stream","attachment_file_size" => 5517,"created_at" => "2011-11-10T15:52:59-02:00","updated_at" => "2011-11-10T15:52:59-02:00","download_url" => "https://app.myfinance.com.br/entities/1/attachments/12/download","attachables" => [],"links" => []}}]) }

  subject { Myfinance::Entities::AttachmentCollection.new(response) }

  describe '#build' do
    it 'returns order collection' do
      expect(subject.build.class).to eq(Myfinance::Entities::AttachmentCollection)
    end

    it "returns orders" do
      subject.build
      expect(subject.collection.count).to eq(1)
      expect(subject.collection.first.class).to eq(Myfinance::Entities::Attachment)
    end
  end
end
