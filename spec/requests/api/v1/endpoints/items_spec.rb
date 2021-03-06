require "rails_helper"

RSpec.describe "Items endpoints" do
  it "returns all items" do
    create_list(:item, 5)

    get "/api/v1/items"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    item = raw["data"]

    expect(item.count).to eq(5)
  end

  it "returns a specific item based on id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    raw = JSON.parse(response.body)
    item = raw["data"]

    expect(item["id"].to_i).to eq(id)
    expect(item.keys).to eq(["id", "type", "attributes"])
    expect(item["attributes"].keys).to eq(["id", "name", "description", "unit_price", "merchant_id"])
    expect(item["attributes"]["name"]).to eq("Flute")
    expect(item["attributes"]["description"]).to eq("Create beautiful music with a flute. This is a description with 2 sentences.")
    expect(item["attributes"]["unit_price"]).to eq("751.07")
  end
end
