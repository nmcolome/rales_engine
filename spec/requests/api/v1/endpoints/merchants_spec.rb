require "rails_helper"

RSpec.describe "merchants endpoints" do
  it "returns all records" do
    create_list(:merchant, 5)

    get "/api/v1/merchants"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    merchant = data["data"]

    expect(merchant.count).to eq(5)
  end

  it "returns a specific record based on id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    data = JSON.parse(response.body)
    merchant = data["data"]

    expect(merchant["id"].to_i).to eq(id)
    expect(merchant["type"]).to eq("merchants")
    expect(merchant.keys).to eq(["id", "type", "attributes"])
    expect(merchant["attributes"].keys).to eq(["id", "name"])
  end
end
