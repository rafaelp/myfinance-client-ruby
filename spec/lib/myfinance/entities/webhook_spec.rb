require 'spec_helper'

describe Myfinance::Entities::Webhook do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
                    :account_id, :created_at, :description, :entity_id,
                    :healthy_check_code, :id, :updated_at, :url
                  ]
end
