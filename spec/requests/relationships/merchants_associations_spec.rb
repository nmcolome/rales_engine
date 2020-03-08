require "rails_helper"

RSpec.describe "Merchants relationships endpoints" do
  it "returns all items associated with a merchant" do
    id = create(:merchant).id
    merchant_items = create_list(:item, 10, merchant_id: id)

    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    items = raw["data"]

    expect(items.count).to eq(10)
    expect(items[0]["id"].to_i).to eq(merchant_items[0].id)
    expect(items[0]["type"]).to eq("items")
    expect(items[0].keys).to eq(["id", "type", "attributes"])
    expect(items[0]["attributes"].keys).to eq(["id", "name", "description", "unit_price", "merchant_id"])
  end

  it "returns all invoices associated with a merchant" do
    id = create(:merchant).id
    merchant_invoices = create_list(:invoice, 10, merchant_id: id)

    get "/api/v1/merchants/#{id}/invoices"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoices = raw["data"]

    expect(invoices.count).to eq(10)
    expect(invoices[0]["id"].to_i).to eq(merchant_invoices[0].id)
    expect(invoices[0]["type"]).to eq("invoices")
    expect(invoices[0].keys).to eq(["id", "type", "attributes"])
    expect(invoices[0]["attributes"].keys).to eq(["id", "status", "customer_id", "merchant_id"])
  end
end
