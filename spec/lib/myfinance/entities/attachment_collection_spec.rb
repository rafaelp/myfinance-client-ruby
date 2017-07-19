require 'spec_helper'

describe Myfinance::Entities::AttachmentCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Attachment
end
