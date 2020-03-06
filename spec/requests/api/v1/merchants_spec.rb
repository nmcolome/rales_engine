require "rails_helper"

RSpec.describe "merchants endpoints" do
  it "returns all records" do
    merchants = create_list(:merchant, 5)

    get "/api/v1/merchants"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    items = data["data"]

    expect(items.count).to eq(5)
  end

  it "returns a specific record based on id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    item = data["data"]

    expect(item["id"].to_i).to eq(id)
    expect(item["type"]).to eq("merchants")
    expect(item.keys).to eq(["id", "type", "attributes"])
    expect(item["attributes"].keys).to eq(["name"])
  end
end
