require 'spec_helper'

describe Myfinance::Resources::Attachment, vcr: true do
  describe "#find_all" do
    context "when success" do
      subject { client.attachments.find_all(3798) }

      it "returns a list of attachments" do
        expect(subject.class).to eq(Myfinance::Entities::AttachmentCollection)
        expect(subject.collection.count).to eq(2)
        expect(subject.collection.first.class).to eq(Myfinance::Entities::Attachment)
        expect(subject.collection.first.id).to eq(1305)
        expect(subject.collection.first.attachment_content_type).to eq("application/octet-stream")
        expect(subject.collection.first.attachment_file_name).to eq("Mensalidade_MyFinance_15-07-2015.oxps")
        expect(subject.collection.first.attachment_file_size).to eq(135328)
        expect(subject.collection.first.download_url).to eq("https://sandbox.myfinance.com.br/entities/3798/attachments/1305/download")
        expect(subject.collection.first.title).to be_nil
        expect(subject.collection.first.created_at).to eq(DateTime.parse("2015-11-11T11:04:15-02:00"))
        expect(subject.collection.first.updated_at).to eq(DateTime.parse("2015-11-11T11:04:15-02:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client('') }
      subject { client.attachments.find_all(3798) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end
