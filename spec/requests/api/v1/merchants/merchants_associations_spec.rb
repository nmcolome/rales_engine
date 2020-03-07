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
    expect(items[0]["type"]).to eq("merchants")
    expect(items[0].keys).to eq(["id", "type", "attributes"])
    expect(items[0]["attributes"].keys).to eq(["name"])
  end
end
