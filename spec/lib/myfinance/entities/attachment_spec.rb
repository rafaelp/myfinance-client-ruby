require 'spec_helper'

describe Myfinance::Entities::Attachment do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :entity_id, :attachment_file_size, :created_at, :updated_at,
    :title, :attachment_file_name, :download_url, :attachment_content_type,
    :attachables, :links
  ]
end
