require "spec_helper"

describe Myfinance::Entities::WebhookCollection do
  it_behaves_like :entity_collection, Myfinance::Entities::Webhook
end
