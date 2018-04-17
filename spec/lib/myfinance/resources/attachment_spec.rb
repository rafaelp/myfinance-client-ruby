require 'spec_helper'

describe Myfinance::Resources::Attachment, vcr: true do
  let!(:entity_id) { 3798 }
  let(:file) { File.open('spec/support/attachments/attachment.png', 'r') }

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

  describe "#find" do
    context "when success" do
      subject { client.attachments.find(3798, 1305) }

      it "returns a list of attachments" do
        expect(subject.class).to eq(Myfinance::Entities::Attachment)
        expect(subject.class).to eq(Myfinance::Entities::Attachment)
        expect(subject.id).to eq(1305)
        expect(subject.attachment_content_type).to eq("application/octet-stream")
        expect(subject.attachment_file_name).to eq("Mensalidade_MyFinance_15-07-2015.oxps")
        expect(subject.attachment_file_size).to eq(135328)
        expect(subject.download_url).to eq("https://sandbox.myfinance.com.br/entities/3798/attachments/1305/download")
        expect(subject.title).to be_nil
        expect(subject.created_at).to eq(DateTime.parse("2015-11-11T11:04:15-02:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2015-11-11T11:04:15-02:00"))
      end
    end

    context "when not found" do
      let(:client) { Myfinance.client('') }
      subject { client.attachments.find(3798, 1305) }

      it "raises NotFound" do
        expect{ subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#create" do
    let(:params) { { title: 'My first attachment' } }
    subject { client.attachments.create(entity_id, file, params) }

    context "with success" do
      it "creates a new object" do
        expect(subject.id).to eq(1585)
        expect(subject.entity_id).to eq(entity_id)
        expect(subject.attachment_file_size).to eq(6115)
        expect(subject.title).to eq(params[:title])
        expect(subject.attachment_file_name).to eq('attachment.png')
        expect(subject.download_url).to eq("https://sandbox.myfinance.com.br/entities/3798/attachments/1585/download")
        expect(subject.attachment_content_type).to eq("image/png")
        expect(subject.created_at).to eq(DateTime.parse("2016-03-01T15:42:30-03:00"))
        expect(subject.updated_at).to eq(DateTime.parse("2016-03-01T15:42:30-03:00"))
        expect(subject.attachables).to be_empty
        expect(subject.links).to eq([{ "rel" => "self", "href" => "https://sandbox.myfinance.com.br/entities/3798/attachments/1585", "method" => "get" }, { "rel" => "download", "href" => "https://sandbox.myfinance.com.br/entities/3798/attachments/1585/download", "method" => "get" }])
      end
    end

    context "when any data is invalid" do
      subject { client.attachments.create(entity_id, nil, params) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 422, message: "Unprocessable Entity", body: { "attachment" => ["não pode ser vazio."] }, headers: instance_of(Typhoeus::Response::Header)).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end

    context "when entity does not exist" do
      subject { client.attachments.create(0, file, params) }

      it "raises Myfinance::RequestError" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end

      it "adds information on request error object" do
        expect(Myfinance::RequestError).to receive(:new).with(code: 403, message: "Forbidden", body: {"error" => "Você não tem permissão para acessar este recurso." }, headers: instance_of(Typhoeus::Response::Header)).and_call_original
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end

  describe "#destroy", vcr: true do
    let(:attachment_id) { 1585 }
    subject { client.attachments.destroy(entity_id, attachment_id) }

    context "when attachment exists" do
      it { expect(subject.code).to eq(200) }
    end

    context "when payable account does not exist" do
      subject { client.attachments.destroy(entity_id, attachment_id) }

      it "raises request error" do
        expect { subject }.to raise_error(Myfinance::RequestError)
      end
    end
  end
end
