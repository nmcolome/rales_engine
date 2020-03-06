require "rails_helper"

RSpec.describe "merchants endpoints" do
  it "returns all records" do
    merchants = create_list(:merchant, 5)

    get "/api/v1/merchants"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
  end

  it "returns a specific record based on id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(id)
  end
end
