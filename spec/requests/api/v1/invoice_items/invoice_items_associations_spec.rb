require "rails_helper"

RSpec.describe "InvoiceItems relationship endpoints" do
  it "returns the invoice associated with an invoice_item" do
    invoice = create(:invoice)
    id = create(:invoice_item, invoice_id: invoice.id).id

    get "/api/v1/invoice_items/#{id}/invoice"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoices = raw["data"]

    expect(invoices["id"].to_i).to eq(invoice.id)
    expect(invoices["type"]).to eq("invoices")
    expect(invoices.keys).to eq(["id", "type", "attributes"])
    expect(invoices["attributes"].keys).to eq(["status", "customer_id", "merchant_id"])
  end

  it "returns the item associated with an invoice_item" do
    item = create(:item)
    id = create(:invoice_item, item_id: item.id).id

    get "/api/v1/invoice_items/#{id}/item"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    items = raw["data"]

    expect(items["id"].to_i).to eq(item.id)
    expect(items["type"]).to eq("items")
    expect(items.keys).to eq(["id", "type", "attributes"])
    expect(items["attributes"].keys).to eq(["name", "description", "unit_price", "merchant_id"])
  end
end
