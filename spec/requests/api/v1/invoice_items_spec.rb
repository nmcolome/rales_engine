require "rails_helper"

RSpec.describe "InvoiceItems endpoints" do
  it "returns all records" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice_items = raw["data"]

    expect(invoice_items.count).to eq(5)
  end
end
