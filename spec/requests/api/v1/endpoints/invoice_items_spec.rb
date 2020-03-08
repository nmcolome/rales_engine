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

  it "returns a specific record based on id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice_item = raw["data"]

    expect(invoice_item["id"].to_i).to eq(id)
    expect(invoice_item.keys).to eq(%w[id type attributes])
    expect(invoice_item["type"]).to eq("invoice_items")
    expect(invoice_item["attributes"].keys).to eq(%w[id quantity unit_price item_id invoice_id])
    expect(invoice_item["attributes"]["quantity"]).to eq(5)
    expect(invoice_item["attributes"]["unit_price"]).to eq("136.35")
  end
end
