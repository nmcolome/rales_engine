require "rails_helper"

RSpec.describe "Items relationships endpoints" do
  it "returns all invoice_items associated with an item" do
    id = create(:item).id
    list= create_list(:invoice_item, 10, item_id: id)

    get "/api/v1/items/#{id}/invoice_items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    invoice_items = raw["data"]

    expect(invoice_items.count).to eq(10)
    expect(invoice_items[0]["id"].to_i).to eq(list[0].id)
    expect(invoice_items[0]["type"]).to eq("invoice_items")
    expect(invoice_items[0].keys).to eq(["id", "type", "attributes"])
    expect(invoice_items[0]["attributes"].keys).to eq(["id", "quantity", "unit_price", "item_id", "invoice_id"])
  end

  it "returns the merchant associated with an item" do
    merchant = create(:merchant)
    id = create(:item, merchant_id: merchant.id).id

    get "/api/v1/items/#{id}/merchant"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    merchants = raw["data"]

    expect(merchants["id"].to_i).to eq(merchant.id)
    expect(merchants["type"]).to eq("merchants")
    expect(merchants.keys).to eq(["id", "type", "attributes"])
    expect(merchants["attributes"].keys).to eq(["id", "name"])
  end
end
